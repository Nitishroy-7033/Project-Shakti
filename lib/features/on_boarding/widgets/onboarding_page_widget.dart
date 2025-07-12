import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/theme/app_text_styles.dart';

import '../models/models.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingModel pageData;

  const OnboardingPageWidget({super.key, required this.pageData});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            pageData.imagePath,
            height: 200,
          ),
          const SizedBox(height: 32),
          Text(
            pageData.title,
            style: AppTextStyles.heading1(brightness),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            pageData.description,
            style: AppTextStyles.body(brightness),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
