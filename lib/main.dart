import 'package:flutter/material.dart';
import 'package:project_shakti/core/routes/routes.dart';
import 'package:project_shakti/core/theme/app_theme.dart';
import 'package:project_shakti/features/on_boarding/on_boarding_screen.dart';

import 'package:project_shakti/features/splash/views/splash_screen.dart';

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
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,
      home: const OnBoardingScreen(),

      //routes: AppRoutes.getRoutes(),
    );
  }
}
