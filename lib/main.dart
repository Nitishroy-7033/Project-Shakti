import 'package:flutter/material.dart';
import 'package:project_shakti/core/routes/routes.dart';
import 'package:project_shakti/core/theme/app_theme.dart';
<<<<<<< HEAD
import 'package:project_shakti/features/start_trip/views/start_trip_screen.dart';
=======
import 'package:project_shakti/core/utils/update_status_bar.dart';
>>>>>>> 384b51d36f6fa206c63753a2cc933ce8a3adfdd3

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
<<<<<<< HEAD
      home: const TripMapScreen(),
=======
      // themeMode: themeController.isLightTheme.value
      //             ? ThemeMode.light
      //             : ThemeMode.dark,
      initialRoute: AppRoutes.splash, //isLogin ? splash : onboarding
>>>>>>> 384b51d36f6fa206c63753a2cc933ce8a3adfdd3
      routes: AppRoutes.getRoutes(),
      builder: (context, child) {
        updateStatusBar(context);
        return child!;
      },
    );
  }
}
