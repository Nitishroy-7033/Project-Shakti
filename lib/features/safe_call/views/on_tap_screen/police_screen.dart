import 'package:flutter/material.dart';

class PoliceScreen extends StatelessWidget {
  const PoliceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Police Help')),
      body: const Center(
        child: Text('Connecting to Police...', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
