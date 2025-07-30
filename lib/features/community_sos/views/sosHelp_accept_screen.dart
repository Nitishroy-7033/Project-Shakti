// ignore_for_file: file_names, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';

class SosHelpAcceptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double circleSize = screenWidth * 0.35;
    final double avatarSize = screenWidth * 0.16;
    final double callIconSize = screenWidth * 0.13;

    return Scaffold(
      backgroundColor: AppColors.primaryLight, // Red background
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.07),
            // Countdown Circle
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: circleSize,
                    height: circleSize,
                    decoration: BoxDecoration(
                      color: AppColors.whiteCommon,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    '3',
                    style: TextStyle(
                      fontSize: screenWidth * 0.13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.fontLight,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            // Emergency Calling Text
            Text(
              'Emergency Calling...',
              style: TextStyle(
                color: AppColors.whiteCommon,
                fontSize: screenWidth * 0.055,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.012),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.12),
              child: Text(
                'Your contact, app users nearby, and your organization will see your request help.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.whiteCommon.withOpacity(0.85),
                  fontSize: screenWidth * 0.038,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            // Avatars and Call Icon
            SizedBox(
              width: screenWidth,
              child: Column(
                children: [
                  // Top avatar
                  Center(
                    child: CircleAvatar(
                      radius: avatarSize / 2,
                      backgroundImage: AssetImage('assets/images/avtar.png'),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.018),
                  // Middle row: left avatar, call icon, right avatar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: avatarSize / 2,
                        backgroundImage: AssetImage('assets/images/avtar.png'),
                      ),
                      SizedBox(width: screenWidth * 0.07),
                      Container(
                        width: callIconSize,
                        height: callIconSize,
                        decoration: BoxDecoration(
                          color: AppColors.whiteCommon,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.errorColor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.radar,
                            color: AppColors.errorColor,
                            size: callIconSize * 0.5,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.07),
                      CircleAvatar(
                        radius: avatarSize / 2,
                        backgroundImage: AssetImage('assets/images/avtar.png'),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.018),
                  // Bottom avatar
                  Center(
                    child: CircleAvatar(
                      radius: avatarSize / 2,
                      backgroundImage: AssetImage('assets/images/avtar.png'),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // I am safe button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.08,
                vertical: screenHeight * 0.04,
              ),
              child: SizedBox(
                width: double.infinity,
                height: screenHeight * 0.065,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.whiteCommon,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'I am safe',
                    style: TextStyle(
                      color: AppColors.fontLight,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
