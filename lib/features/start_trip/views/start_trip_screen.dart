import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:project_shakti/core/theme/app_text_styles.dart';

import '../../../core/theme/app_colors.dart';

class TripMapScreen extends StatefulWidget {
  const TripMapScreen({super.key});

  @override
  State<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends State<TripMapScreen> {
  late GoogleMapController _mapController;

  final _sourceController = TextEditingController();
  final _destinationController = TextEditingController();
  final _dateTimeController = TextEditingController();

  LatLng? _sourceLatLng;
  LatLng? _destinationLatLng;
  List<LatLng> _polylinePoints = [];
  String _selectedMode = "Bicycling";
  DateTime? _selectedDateTime;

  int _currentProgressIndex = 0;
  bool _isLoading = false;
  bool _isTripActive = false;

  Timer? _tripTimer;

  static const String _apiKey = "AIzaSyDK4ylJEGO07EmXn9FFybZDzKy_7k2Mo40";
  static const LatLng _defaultLocation = LatLng(28.6139, 77.2090);

  @override
  void dispose() {
    _tripTimer?.cancel();
    _sourceController.dispose();
    _destinationController.dispose();
    _dateTimeController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<LatLng?> _getCoordinates(String place) async {
    try {
      List<Location> locations = await locationFromAddress(place);
      if (locations.isNotEmpty) {
        return LatLng(locations.first.latitude, locations.first.longitude);
      }
    } catch (e) {
      debugPrint("Error getting coordinates: $e");
    }
    return null;
  }

  Future<void> _getRoute() async {
    if (_sourceLatLng == null || _destinationLatLng == null) return;

    final url =
        "https://maps.googleapis.com/maps/api/directions/json"
        "?origin=${_sourceLatLng!.latitude},${_sourceLatLng!.longitude}"
        "&destination=${_destinationLatLng!.latitude},${_destinationLatLng!.longitude}"
        "&mode=${_selectedMode.toLowerCase()}"
        "&key=$_apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      final json = jsonDecode(response.body);

      if (json['routes'].isNotEmpty) {
        final points = json['routes'][0]['overview_polyline']['points'];
        _polylinePoints = _decodePolyline(points);
        _currentProgressIndex = 0;
        setState(() {});
      }
    } catch (e) {
      _showErrorSnackBar("Failed to get route: $e");
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }

  void _simulateTravelProgress() {
    setState(() => _isTripActive = true);
    _currentProgressIndex = 0;

    _tripTimer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (!_isTripActive ||
          _currentProgressIndex >= _polylinePoints.length - 1) {
        timer.cancel();
        setState(() {
          _isTripActive = false;
          _currentProgressIndex = _polylinePoints.length - 1;
        });
        _showSuccessSnackBar("Trip completed!");
        return;
      }

      if (mounted) {
        setState(() {
          _currentProgressIndex++;
        });
      }
    });
  }

  Future<void> _startTrip() async {
    if (!_validateInputs()) return;

    setState(() => _isLoading = true);

    try {
      final source = await _getCoordinates(_sourceController.text.trim());
      final destination = await _getCoordinates(
        _destinationController.text.trim(),
      );

      if (source == null || destination == null) {
        _showErrorSnackBar("Invalid source or destination location");
        return;
      }

      _sourceLatLng = source;
      _destinationLatLng = destination;

      await _getRoute();

      if (_polylinePoints.isEmpty) {
        _showErrorSnackBar("No route found. Please try another location.");
        return;
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _animateToRoute();
      });

      await Future.delayed(const Duration(milliseconds: 300));
      _simulateTravelProgress();
    } catch (e) {
      _showErrorSnackBar("Failed to start trip: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _stopTrip() {
    _tripTimer?.cancel();
    setState(() {
      _isTripActive = false;
      _currentProgressIndex = 0;
    });
  }

  bool _validateInputs() {
    if (_sourceController.text.trim().isEmpty ||
        _destinationController.text.trim().isEmpty) {
      _showErrorSnackBar("Please enter both source and destination");
      return false;
    }
    return true;
  }

  void _animateToRoute() {
    if (_sourceLatLng != null && _destinationLatLng != null) {
      _mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(
              min(_sourceLatLng!.latitude, _destinationLatLng!.latitude),
              min(_sourceLatLng!.longitude, _destinationLatLng!.longitude),
            ),
            northeast: LatLng(
              max(_sourceLatLng!.latitude, _destinationLatLng!.latitude),
              max(_sourceLatLng!.longitude, _destinationLatLng!.longitude),
            ),
          ),
          100.0,
        ),
      );
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.errorColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.successColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Trip Planner",
          style: AppTextStyles.appBarTitle(brightness),
        ),
      ),
      body: Column(
        children: [
          _buildTripForm(),
          _buildMapContainer(),
          _buildActionButtons(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTripForm() {
    final brightness = Theme.of(context).brightness;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.fontDark,
              border: Border.all(color: Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Current Location Row
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: AppColors.successColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Your Current Location",
                        style: AppTextStyles.label(brightness),
                      ),
                    ],
                  ),

                  const Divider(
                    color: Color(0xFFE0E0E0),
                    thickness: 1,
                    height: 20,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // Drop Location Row
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: AppColors.errorColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          controller: _destinationController,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.blackCommon,
                          ),
                          decoration: InputDecoration(
                            hintText: "Drop location",
                            hintStyle: AppTextStyles.label(
                              brightness,
                            ).copyWith(color: AppColors.labelLight),
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          _buildModeSelector(),
        ],
      ),
    );
  }

  Widget _buildModeSelector() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.fontDark,
        border: Border.all(color: Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButtonFormField<String>(
        value: _selectedMode,
        decoration: const InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 16),
        ),
        icon: Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
        dropdownColor: Colors.white,
        style: TextStyle(
          color: AppColors.labelDark,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        onChanged: (value) {
          setState(() => _selectedMode = value!);
        },
        items:
            ["Walking", "Driving", "Bicycling", "Transit"].map((mode) {
              return DropdownMenuItem<String>(
                value: mode,
                child: Row(
                  children: [
                    Icon(_getModeIcon(mode), size: 20, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Text(mode),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  IconData _getModeIcon(String mode) {
    switch (mode) {
      case "Walking":
        return Icons.directions_walk;
      case "Driving":
        return Icons.directions_car;
      case "Bicycling":
        return Icons.directions_bike;
      case "Transit":
        return Icons.directions_transit;
      default:
        return Icons.directions;
    }
  }

  Widget _buildMapContainer() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: _defaultLocation,
              zoom: 12,
            ),
            markers: _buildMarkers(),
            polylines: _buildPolylines(),
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),
        ),
      ),
    );
  }

  Set<Marker> _buildMarkers() {
    Set<Marker> markers = {};

    if (_sourceLatLng != null) {
      markers.add(
        Marker(
          markerId: const MarkerId("source"),
          position: _sourceLatLng!,
          infoWindow: const InfoWindow(title: "Start"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        ),
      );
    }

    if (_destinationLatLng != null) {
      markers.add(
        Marker(
          markerId: const MarkerId("destination"),
          position: _destinationLatLng!,
          infoWindow: const InfoWindow(title: "Destination"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    }

    if (_polylinePoints.isNotEmpty && _isTripActive) {
      markers.add(
        Marker(
          markerId: const MarkerId("current"),
          position: _polylinePoints[_currentProgressIndex],
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
      );
    }

    return markers;
  }

  Set<Polyline> _buildPolylines() {
    Set<Polyline> polylines = {};

    if (_polylinePoints.isNotEmpty) {
      polylines.add(
        Polyline(
          polylineId: const PolylineId("route"),
          color: Colors.blue.shade300,
          width: 5,
          points: _polylinePoints,
        ),
      );

      if (_isTripActive && _currentProgressIndex > 0) {
        polylines.add(
          Polyline(
            polylineId: const PolylineId("traveled"),
            color: AppColors.successColor,
            width: 6,
            points: _polylinePoints.sublist(0, _currentProgressIndex + 1),
          ),
        );
      }
    }

    return polylines;
  }

  Widget _buildActionButtons() {
    final brightness = Theme.of(context).brightness;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    _isTripActive ? AppColors.fontDark : AppColors.successColor,
                foregroundColor: AppColors.fontDark,
              ),
              onPressed:
                  _isLoading
                      ? null
                      : _isTripActive
                      ? _stopTrip
                      : _startTrip,
              child: Text(
                _isLoading
                    ? "Loading..."
                    : _isTripActive
                    ? "Stop Trip"
                    : "Start Trip",
                style: AppTextStyles.label(brightness),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.errorColor,
                foregroundColor: AppColors.fontDark,
              ),
              onPressed: () {
                _showErrorSnackBar("SOS feature not implemented yet");
              },
              child: Text("SOS", style: AppTextStyles.label(brightness)),
            ),
          ),
        ],
      ),
    );
  }
}
