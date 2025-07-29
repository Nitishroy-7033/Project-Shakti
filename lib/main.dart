import 'package:flutter/material.dart';
import 'package:project_shakti/core/routes/routes.dart';
import 'package:project_shakti/core/theme/app_theme.dart';
import 'package:project_shakti/core/utils/update_status_bar.dart';
import 'package:project_shakti/features/trip_history/views/trip_history_screen.dart';

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
      // themeMode: themeController.isLightTheme.value
      //             ? ThemeMode.light
      //             : ThemeMode.dark,
      initialRoute: AppRoutes.tripHistory, //isLogin ? splash : onboarding
      routes: AppRoutes.getRoutes(),
      builder: (context, child) {
        updateStatusBar(context);
        return child!;
      },
    );
  }
}
