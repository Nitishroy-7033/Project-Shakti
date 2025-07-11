

import 'package:flutter/material.dart';

class ShareLocationPage extends StatelessWidget {
  const ShareLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustration
          Container(
            height: 280,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[100],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/share_location_illustration.png',
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Title
          Text(
            'Share Location',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: -0.5,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 20),

          // Description
          Text(
            'On emergency situation easily share your live location with our friends, family and closed ones.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
              letterSpacing: 0.2,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 60),
        ],
      ),
    );
  }
}
