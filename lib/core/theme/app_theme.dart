import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';

class AppTheme {
  bool isLightTheme = true;
  isDarkTheme() {
    return !isLightTheme;
  }

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      surface: AppColors.backgroundLight,
      onSurface: AppColors.fontLight,
      primary: AppColors.primaryLight,
      onPrimary: AppColors.whiteCommon,
      secondary: AppColors.secondaryLight,
      primaryContainer: AppColors.primaryContainerLight,
      tertiary: AppColors.labelLight,
      error: AppColors.errorColor,
      onPrimaryContainer: AppColors.fontLight,
    ),

    // TEXT THEME
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: AppColors.fontLight,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppColors.fontLight,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.fontLight,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppColors.fontLight,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: AppColors.fontLight,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppColors.labelLight,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.labelLight,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontSize: 12,
        color: AppColors.labelLight,
      ),
    ),
  );

  // DARK THEME
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      surface: AppColors.backgroundDark,
      onSurface: AppColors.fontDark,
      primary: AppColors.primaryDark,
      onPrimary: AppColors.whiteCommon,
      secondary: AppColors.secondaryDark,
      primaryContainer: AppColors.primaryContainerDark,
      tertiary: AppColors.labelDark,
      error: AppColors.errorColor,
      onPrimaryContainer: AppColors.fontDark,
    ),

    // TEXT THEME
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: AppColors.fontDark,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: AppColors.fontDark,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppColors.fontDark,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.fontDark,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppColors.fontDark,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: AppColors.fontDark,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppColors.labelDark,
      ),
      labelMedium: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.labelDark,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w300,
        fontSize: 12,
        color: AppColors.labelDark,
      ),
    ),
  );
}
