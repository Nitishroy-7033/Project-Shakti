import 'package:flutter/material.dart';
import 'package:project_shakti/core/constants/app_images.dart';

class LocationReviewPage extends StatelessWidget {
  const LocationReviewPage({super.key});

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
            child: Image.asset(AppImages.onBoarding3, fit: BoxFit.fill),
          ),
          // Title
          Text(
            'Location Review',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          // Description
          Text(
            'Users can review reports of sexual harassment cases and their location right when the report goes online so that they can prepare themselves if they go to that location.',
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
