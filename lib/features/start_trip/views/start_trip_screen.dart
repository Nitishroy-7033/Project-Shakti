<<<<<<< HEAD
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;



=======
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

>>>>>>> 384b51d36f6fa206c63753a2cc933ce8a3adfdd3
class TripMapScreen extends StatefulWidget {
  const TripMapScreen({super.key});

  @override
  State<TripMapScreen> createState() => _TripMapScreenState();
}

class _TripMapScreenState extends State<TripMapScreen> {
<<<<<<< HEAD
  late GoogleMapController mapController;

  LatLng? sourceLatLng;
  LatLng? destinationLatLng;
  List<LatLng> polylinePoints = [];

  double totalDistance = 0.0;
  int currentProgressIndex = 0;

  final sourceController = TextEditingController();
  final destinationController = TextEditingController();
  final dateTimeController = TextEditingController();
  String selectedMode = "Bicycling";

  DateTime? selectedDateTime;

  Future<LatLng?> getCoordinates(String place) async {
=======
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
>>>>>>> 384b51d36f6fa206c63753a2cc933ce8a3adfdd3
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

<<<<<<< HEAD
  Future<void> _getPolylineRoute() async {
    if (sourceLatLng == null || destinationLatLng == null) return;

    const String apiKey = "AIzaSyDK4ylJEGO07EmXn9FFybZDzKy_7k2Mo40";
    final url =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${sourceLatLng!.latitude},${sourceLatLng!.longitude}&destination=${destinationLatLng!.latitude},${destinationLatLng!.longitude}&mode=${selectedMode.toLowerCase()}&key=$apiKey";

    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    if (json['routes'].isNotEmpty) {
      final points = json['routes'][0]['overview_polyline']['points'];
      polylinePoints = _decodePolyline(points);
      totalDistance = _calculateTotalDistance(polylinePoints);
      currentProgressIndex = 0;
      setState(() {});
=======
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
>>>>>>> 384b51d36f6fa206c63753a2cc933ce8a3adfdd3
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

<<<<<<< HEAD
  double _calculateTotalDistance(List<LatLng> points) {
    double distance = 0.0;
    for (int i = 0; i < points.length - 1; i++) {
      distance += _coordinateDistance(
        points[i].latitude,
        points[i].longitude,
        points[i + 1].latitude,
        points[i + 1].longitude,
      );
    }
    return distance;
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    const p = 0.017453292519943295;
    final a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) *
            cos(lat2 * p) *
            (1 - cos((lon2 - lon1) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }

  void _simulateTravelProgress() async {
    for (int i = 0; i < polylinePoints.length; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      setState(() {
        currentProgressIndex = i;
      });
    }
  }

  void _startTrip() async {
    final sourceText = sourceController.text.trim();
    final destinationText = destinationController.text.trim();

    if (sourceText.isEmpty || destinationText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both source and destination.")),
      );
      return;
    }

    final source = await getCoordinates(sourceText);
    final destination = await getCoordinates(destinationText);

    if (source == null || destination == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid source or destination.")),
      );
      return;
    }

    setState(() {
      sourceLatLng = source;
      destinationLatLng = destination;
    });

    await _getPolylineRoute();
    _simulateTravelProgress();

    mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(
            min(source.latitude, destination.latitude),
            min(source.longitude, destination.longitude),
          ),
          northeast: LatLng(
            max(source.latitude, destination.latitude),
            max(source.longitude, destination.longitude),
          ),
        ),
        80.0,
      ),
    );
=======
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
>>>>>>> 384b51d36f6fa206c63753a2cc933ce8a3adfdd3
  }

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

<<<<<<< HEAD
    final dt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    setState(() {
      selectedDateTime = dt;
      dateTimeController.text = "${dt.toLocal()}".split(".")[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Trip Planner"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _textField("Start Location", sourceController, "e.g. Connaught Place"),
                  const SizedBox(height: 10),
                  _textField("Destination", destinationController, "e.g. India Gate"),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: _pickDateTime,
                    child: AbsorbPointer(
                      child: _textField("Date/Time", dateTimeController, "Select Date and Time"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _modeDropdown(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(28.6139, 77.2090),
                    zoom: 12,
                  ),
                  markers: {
                    if (sourceLatLng != null)
                      Marker(
                        markerId: const MarkerId("source"),
                        position: sourceLatLng!,
                        infoWindow: const InfoWindow(title: "Start"),
                        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                      ),
                    if (destinationLatLng != null)
                      Marker(
                        markerId: const MarkerId("destination"),
                        position: destinationLatLng!,
                        infoWindow: const InfoWindow(title: "Destination"),
                        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                      ),
                    if (polylinePoints.isNotEmpty)
                      Marker(
                        markerId: const MarkerId("moving"),
                        position: polylinePoints[currentProgressIndex],
                        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
                      ),
                  },
                  polylines: {
                    if (polylinePoints.isNotEmpty)
                      Polyline(
                        polylineId: const PolylineId("fullPath"),
                        color: Colors.orange,
                        width: 6,
                        points: polylinePoints,
                      ),
                    if (polylinePoints.isNotEmpty && currentProgressIndex > 0)
                      Polyline(
                        polylineId: const PolylineId("traveledPath"),
                        color: Colors.green,
                        width: 6,
                        points: polylinePoints.sublist(0, currentProgressIndex + 1),
                      ),
                  },
                  onMapCreated: (controller) => mapController = controller,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _startTrip,
                      icon: const Icon(Icons.play_arrow),
                      label: const Text("Start Trip"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("SOS Triggered")),
                        );
                      },
                      icon: const Icon(Icons.warning),
                      label: const Text("SOS"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
=======
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

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

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
      appBar: AppBar(title: const Text("Trip Planner")),
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
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _sourceController,
            decoration: const InputDecoration(
              labelText: "Start Location",
              prefixIcon: Icon(Icons.my_location),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _destinationController,
            decoration: const InputDecoration(
              labelText: "Destination",
              prefixIcon: Icon(Icons.location_on),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: _pickDateTime,
            child: AbsorbPointer(
              child: TextField(
                controller: _dateTimeController,
                decoration: const InputDecoration(
                  labelText: "Date & Time",
                  prefixIcon: Icon(Icons.access_time),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _buildModeSelector(),
        ],
      ),
    );
  }

  Widget _buildModeSelector() {
    return DropdownButtonFormField<String>(
      value: _selectedMode,
      decoration: const InputDecoration(
        labelText: "Travel Mode",
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        setState(() => _selectedMode = value!);
      },
      items: ["Walking", "Driving", "Bicycling", "Transit"].map((mode) {
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
>>>>>>> 384b51d36f6fa206c63753a2cc933ce8a3adfdd3
        ),
      ),
    );
  }

<<<<<<< HEAD
  Widget _textField(String label, TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _modeDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<String>(
        value: selectedMode,
        isExpanded: true,
        underline: const SizedBox(),
        onChanged: (value) {
          setState(() {
            selectedMode = value!;
          });
        },
        items: ["Walking", "Driving", "Bicycling", "Transit"]
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text("Mode of Travel: $value"),
          );
        }).toList(),
     ),
);
}
=======
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
            color: Colors.green,
            width: 6,
            points: _polylinePoints.sublist(0, _currentProgressIndex + 1),
          ),
        );
      }
    }

    return polylines;
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isTripActive ? Colors.orange : Colors.green,
              ),
              onPressed: _isLoading
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
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                _showErrorSnackBar("SOS feature not implemented yet");
              },
              child: const Text("SOS"),
            ),
          ),
        ],
      ),
    );
  }
>>>>>>> 384b51d36f6fa206c63753a2cc933ce8a3adfdd3
}