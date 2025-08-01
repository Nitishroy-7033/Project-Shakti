import 'package:flutter/material.dart';

class WomenHelplineScreen extends StatelessWidget {
  const WomenHelplineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Women Helpline')),
      body: const Center(
        child: Text('Connecting to Women Helpline...', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
