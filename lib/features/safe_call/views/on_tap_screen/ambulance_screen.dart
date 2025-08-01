import 'package:flutter/material.dart';

class AmbulanceScreen extends StatelessWidget {
  const AmbulanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ambulance Help')),
      body: const Center(
        child: Text('Connecting to Ambulance...', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
