import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/theme/app_text_styles.dart';
import 'package:project_shakti/features/end_trip/widgets/widgets.dart';

class EndTripScreen extends StatefulWidget {
  const EndTripScreen({super.key});

  @override
  State<EndTripScreen> createState() => _EndTripScreenState();
}

class _EndTripScreenState extends State<EndTripScreen> {
  late GoogleMapController mapController;
  double _rating = 0;

  final LatLng startLocation = const LatLng(28.644800, 77.2090); // Delhi
  final LatLng endLocation = const LatLng(28.6139, 77.216721);

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: AppColor.background(brightness),
      appBar: AppBar(
        title: Text(
          'Trip Completed',
          style: AppTextStyles.appBarTitle(brightness),
        ),
        centerTitle: true,
        backgroundColor: AppColor.card(brightness),
        elevation: 1,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 800),
                curve: Curves.elasticOut,
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: AppColor.success(brightness).withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        size: 60,
                        color: AppColor.success(brightness),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'You’ve reached safely!',
              textAlign: TextAlign.center,
              style: AppTextStyles.heading1(brightness),
            ),
            const SizedBox(height: 6),
            Text(
              'Thanks for trusting Shakti. Let us know how your trip went.',
              textAlign: TextAlign.center,
              style: AppTextStyles.subheading(brightness),
            ),
            const SizedBox(height: 24),

            // ✅ Map with gestures
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 220,
                child: GestureDetector(
                  onVerticalDragDown: (_) {},
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        (startLocation.latitude + endLocation.latitude) / 2,
                        (startLocation.longitude + endLocation.longitude) / 2,
                      ),
                      zoom: 12,
                    ),
                    markers: {
                      Marker(
                        markerId: const MarkerId('start'),
                        position: startLocation,
                      ),
                      Marker(
                        markerId: const MarkerId('end'),
                        position: endLocation,
                      ),
                    },
                    polylines: {
                      Polyline(
                        polylineId: const PolylineId('route'),
                        points: [startLocation, endLocation],
                        color: Colors.blueAccent,
                        width: 4,
                      ),
                    },
                    zoomControlsEnabled: true,
                    myLocationButtonEnabled: false,
                    onMapCreated: (controller) => mapController = controller,
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      ),
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Trip Info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColor.card(brightness),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TripInfoRow(
                    label: 'From:',
                    value: 'Guwahati, 781005, Assam, India',
                    icon: Icons.location_on_outlined,
                    iconColor: Colors.redAccent,
                  ),
                  TripInfoRow(
                    label: 'To:',
                    value: 'Rakesh Home, Bengaluru',
                    icon: Icons.flag_outlined,
                    iconColor: Colors.green,
                  ),
                  TripInfoRow(
                    label: 'Duration:',
                    value: '58 hrs 30 mins',
                    icon: Icons.timer_outlined,
                    iconColor: Colors.blueAccent,
                  ),
                  TripInfoRow(
                    label: 'Distance:',
                    value: '2920.8 km',
                    icon: Icons.route_outlined,
                    iconColor: Colors.deepPurple,
                  ),
                  TripInfoRow(
                    label: 'Ended at:',
                    value: '9:48 PM',
                    icon: Icons.access_time_outlined,
                    iconColor: Colors.orangeAccent,
                  ),
                  TripInfoRow(
                    label: 'Trip ID:',
                    value: '#XTRP292',
                    icon: Icons.confirmation_number_outlined,
                    iconColor: Colors.teal,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Rating
            Text(
              'How was your trip?',
              style: AppTextStyles.heading3(brightness),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder:
                  (context, _) =>
                      const Icon(Icons.emoji_emotions, color: Colors.amber),
              onRatingUpdate: (rating) => setState(() => _rating = rating),
            ),
            const SizedBox(height: 16),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.success(brightness),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      print("Rating: $_rating");
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Done'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.directions_walk),
                    label: const Text('New Trip'),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 12, right: 4),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Report a Problem',
                    style: AppTextStyles.caption(brightness).copyWith(
                      color: AppColor.error(brightness),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
