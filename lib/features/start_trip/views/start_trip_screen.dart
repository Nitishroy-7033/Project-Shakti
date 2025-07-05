import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:project_shakti/core/widgets/custom_button.dart';
import 'package:project_shakti/core/widgets/custom_text_field.dart';

class TripMapScreen extends StatefulWidget {
  const TripMapScreen({super.key});

  @override
  State<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends State<TripMapScreen> {
  late GoogleMapController _mapController;

  // Controllers
  final _sourceController = TextEditingController();
  final _destinationController = TextEditingController();
  final _dateTimeController = TextEditingController();

  // Trip data
  LatLng? _sourceLatLng;
  LatLng? _destinationLatLng;
  List<LatLng> _polylinePoints = [];
  String _selectedMode = "Bicycling";
  DateTime? _selectedDateTime;

  // Animation
  int _currentProgressIndex = 0;
  bool _isLoading = false;
  bool _isTripActive = false;

  static const String _apiKey = "AIzaSyDK4ylJEGO07EmXn9FFybZDzKy_7k2Mo40";
  static const LatLng _defaultLocation = LatLng(28.6139, 77.2090);

  @override
  void dispose() {
    _sourceController.dispose();
    _destinationController.dispose();
    _dateTimeController.dispose();
    super.dispose();
  }

  // Get coordinates from address
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

  // Get route from Google Directions API
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

  // Decode polyline points
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

  // Simulate travel progress
  void _simulateTravelProgress() async {
    setState(() => _isTripActive = true);

    for (int i = 0; i < _polylinePoints.length; i++) {
      if (!_isTripActive) break;
      await Future.delayed(const Duration(milliseconds: 300));
      if (mounted) {
        setState(() => _currentProgressIndex = i);
      }
    }

    if (mounted) {
      setState(() => _isTripActive = false);
      _showSuccessSnackBar("Trip completed!");
    }
  }

  // Start trip
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
      _animateToRoute();
      _simulateTravelProgress();
    } catch (e) {
      _showErrorSnackBar("Failed to start trip: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Stop trip
  void _stopTrip() {
    setState(() {
      _isTripActive = false;
      _currentProgressIndex = 0;
    });
  }

  // Validate inputs
  bool _validateInputs() {
    if (_sourceController.text.trim().isEmpty ||
        _destinationController.text.trim().isEmpty) {
      _showErrorSnackBar("Please enter both source and destination");
      return false;
    }
    return true;
  }

  // Animate camera to show route
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

  // Pick date and time
  Future<void> _pickDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date == null) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;

    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() {
      _selectedDateTime = dateTime;
      _dateTimeController.text = "${dateTime.toLocal()}".split(".")[0];
    });
  }

  // Show error snackbar
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Show success snackbar
  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trip Planner"),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
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

  // Build trip form
  Widget _buildTripForm() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomTextField(
            labelText: "Start Location",
            prefixIcon: Icons.my_location,
            controller: _sourceController,
          ),
          const SizedBox(height: 12),
          CustomTextField(
            labelText: "Destination",
            prefixIcon: Icons.location_on,
            controller: _destinationController,
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: _pickDateTime,
            child: AbsorbPointer(
              child: CustomTextField(
                labelText: "Date & Time",
                prefixIcon: Icons.access_time,
                controller: _dateTimeController,
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildModeSelector(),
        ],
      ),
    );
  }

  // Build mode selector
  Widget _buildModeSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: _selectedMode,
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down),
        onChanged: (value) {
          setState(() => _selectedMode = value!);
        },
        items:
            ["Walking", "Driving", "Bicycling", "Transit"].map((mode) {
              return DropdownMenuItem<String>(
                value: mode,
                child: Row(
                  children: [
                    Icon(_getModeIcon(mode), size: 20),
                    const SizedBox(width: 8),
                    Text(mode),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }

  // Get mode icon
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

  // Build map container
  Widget _buildMapContainer() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: _defaultLocation,
              zoom: 12,
            ),
            markers: _buildMarkers(),
            polylines: _buildPolylines(),
            onMapCreated: (controller) => _mapController = controller,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            compassEnabled: false,
            mapToolbarEnabled: false,
          ),
        ),
      ),
    );
  }

  // Build markers
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

  // Build polylines
  Set<Polyline> _buildPolylines() {
    Set<Polyline> polylines = {};

    if (_polylinePoints.isNotEmpty) {
      polylines.add(
        Polyline(
          polylineId: const PolylineId("route"),
          color: Colors.blue.shade300,
          width: 5,
          points: _polylinePoints,
          patterns: [PatternItem.dash(20), PatternItem.gap(10)],
        ),
      );

      if (_isTripActive && _currentProgressIndex > 0) {
        polylines.add(
          Polyline(
            polylineId: const PolylineId("traveled"),
            color: Colors.green,
            width: 6,
            points: _polylinePoints.sublist(0, _currentProgressIndex + 1),
          ),
        );
      }
    }

    return polylines;
  }

  // Build action buttons
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text:
                  _isLoading
                      ? "Loading..."
                      : _isTripActive
                      ? "Stop Trip"
                      : "Start Trip",
              backgroundColor: _isTripActive ? Colors.orange : Colors.green,
              onPressed:
                  _isLoading
                      ? null
                      : _isTripActive
                      ? _stopTrip
                      : _startTrip,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: CustomButton(
              text: "SOS",
              backgroundColor: Colors.red,
              onPressed: () {
                // TODO: Implement SOS functionality
                _showErrorSnackBar("SOS feature not implemented yet");
              },
            ),
          ),
        ],
      ),
    );
  }
}
