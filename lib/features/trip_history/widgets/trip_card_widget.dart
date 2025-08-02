import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/theme/app_text_styles.dart';
import '../models/trip_model.dart';

class TripCardWidget extends StatelessWidget {
  final Trip trip;

  const TripCardWidget({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    Color statusColor;
    String statusText;
    IconData statusIcon;

    if (trip.status == TripStatus.safe) {
      statusColor = Colors.green;
      statusText = 'Safe trip';
      statusIcon = Icons.check_circle;
    } else {
      statusColor = Colors.red;
      statusText = 'Not safe';
      statusIcon = Icons.warning;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.route,
                        color:
                            brightness == Brightness.light
                                ? AppColors.primaryLight
                                : AppColors.primaryDark,
                      ),
                      const SizedBox(width: 8.0),
                      Text('From', style: AppTextStyles.bodyBold(brightness)),
                      const SizedBox(width: 4.0),
                      Expanded(
                        child: Text(
                          trip.fromLocation,
                          style: AppTextStyles.body(brightness),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Icon(statusIcon, color: statusColor, size: 16),
                      const SizedBox(width: 4.0),
                      Text(
                        statusText,
                        style: AppTextStyles.caption(
                          brightness,
                        ).copyWith(color: statusColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color:
                      brightness == Brightness.light
                          ? AppColors.primaryLight
                          : AppColors.primaryDark,
                ),
                const SizedBox(width: 8.0),
                Text('To', style: AppTextStyles.bodyBold(brightness)),
                const SizedBox(width: 4.0),
                Expanded(
                  child: Text(
                    trip.toLocation,
                    style: AppTextStyles.body(brightness),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Divider(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Leave time',
                      style: AppTextStyles.caption(brightness),
                    ),
                    Text(
                      trip.leaveTime,
                      style: AppTextStyles.bodyBold(brightness),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reached time',
                      style: AppTextStyles.caption(brightness),
                    ),
                    Text(
                      trip.reachedTime,
                      style: AppTextStyles.bodyBold(brightness),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Distance', style: AppTextStyles.caption(brightness)),
                    Text(
                      trip.distance,
                      style: AppTextStyles.bodyBold(brightness),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
