import 'package:flutter/material.dart';

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
            child: Image.asset(
              'assets/images/emergency_alert_illustration.png',
              fit: BoxFit.fill,
            ),
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