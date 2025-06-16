import 'package:flutter/material.dart';
import 'package:project_shakti/screens/Login_Screen.dart';
import 'package:project_shakti/screens/fake_call.dart';
import 'package:project_shakti/screens/signup_screen.dart';

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
      home: const SignupScreen(),
    );
  }
}
