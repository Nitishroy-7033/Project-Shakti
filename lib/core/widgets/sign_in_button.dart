import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final String imagePath;
  final String labelText;
  const SignInButton({
    super.key,
    required this.imagePath,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Image.asset(imagePath, width: 35),
        label: Text(
          labelText,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
        ),
      ),
    );
  }
}
