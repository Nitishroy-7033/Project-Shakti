import 'package:flutter/material.dart';
import 'package:project_shakti/pages/AddFriendPage.dart';
import 'package:project_shakti/screens/fake_call.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shakti',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AddFriendPage(),
    );
  }
}
