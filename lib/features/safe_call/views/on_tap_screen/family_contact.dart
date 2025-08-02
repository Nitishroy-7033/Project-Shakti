import 'package:flutter/material.dart';

class FamilyContactScreen extends StatelessWidget {
  const FamilyContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Family Contact')),
      body: const Center(
        child: Text('Calling Family Contact...', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
