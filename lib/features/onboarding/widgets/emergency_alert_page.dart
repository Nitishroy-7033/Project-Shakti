import 'package:flutter/material.dart';
import 'package:project_shakti/core/constants/app_images.dart';

class EmergencyAlertPage extends StatelessWidget {
  const EmergencyAlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        spacing: 20,
        children: [
          SizedBox(height: 80),
          SizedBox(
            height: 300,
            child: Image.asset(AppImages.onBoarding1, fit: BoxFit.fill),
          ),
          // Title
          Text(
            'Emergency Alert',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          // Description
          Text(
            'Emergency alert functionality can call and send SMS on saved contacts if stuck in a panic situation.',
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
