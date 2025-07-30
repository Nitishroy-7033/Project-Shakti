import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_shakti/features/live_trip/widgets/timer_alert.dart';


class LiveTripScreen extends StatefulWidget {
  const LiveTripScreen({Key? key}) : super(key: key);

  @override
  State<LiveTripScreen> createState() => _LiveTripScreenState();
}

class _LiveTripScreenState extends State<LiveTripScreen> {
  GoogleMapController? _controller;

  final LatLng _start = const LatLng(13.038, 77.596);
  final LatLng _end = const LatLng(12.9716, 77.5946);

  double _progressValue = 0.6; // Example progress (60%)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _start, zoom: 11),
            onMapCreated: (controller) => _controller = controller,
            markers: {
              Marker(markerId: const MarkerId("start"), position: _start),
              Marker(markerId: const MarkerId("end"), position: _end),
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId("route"),
                points: [_start, _end],
                color: Colors.blue,
                width: 4,
              ),
            },
          ),

          // Bottom Card
          Positioned(
            left: 12,
            right: 12,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1), blurRadius: 8),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Ongoing Trip to Home",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text("ETA: 7:45 PM   Duration: 15 min remaining",style: TextStyle(fontSize: 12),),
                  const SizedBox(height: 16),
                  // Progress bar (top)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      minHeight: 6,
                      value: _progressValue,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.green), // Progress color
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () {
                            _showSafetyTimerDialog(context);
                          },
                          child: const Text("HELP",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          onPressed: () {},
                          child: const Text("+10 Min",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {},
                          child: const Text("COMPLETE",style: TextStyle(color: Colors.white,fontSize: 11),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Show Safety Timer Alert Dialog
  void _showSafetyTimerDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      pageBuilder: (context, anim1, anim2) {
        return const SafetyTimerAlert();
     },
);
}
}