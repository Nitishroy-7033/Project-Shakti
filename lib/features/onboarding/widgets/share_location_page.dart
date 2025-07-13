import 'package:flutter/material.dart';

class ShareLocationPage extends StatelessWidget {
  const ShareLocationPage({super.key});

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
              'assets/images/share_location_illustration.png',
              fit: BoxFit.fill,
            ),
          ),
          // Title
          Text(
            'Share Location',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          // Description
          Text(
            'On emergency situation easily share your live location with our friends, family and closed ones.',
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}