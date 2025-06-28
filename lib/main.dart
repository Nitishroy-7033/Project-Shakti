import 'package:flutter/material.dart';
import 'package:project_shakti/views/AddFriendPage.dart';
import 'package:project_shakti/views/cangePassword_screen.dart';
import 'package:project_shakti/views/editProfile_screen.dart';
import 'package:project_shakti/views/fake_call.dart';
import 'package:project_shakti/views/profile_Screen.dart';

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
      home: const ProfileScreen(),
    );
  }
}
