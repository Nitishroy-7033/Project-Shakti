import 'package:flutter/material.dart';
import 'package:project_shakti/core/constants/app_colors.dart';

class AppThemes {
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
      primaryContainer: AppColors.primaryContainerLight,
      tertiary: AppColors.labelLight,
      error: AppColors.errorColor,
      onPrimaryContainer: AppColors.fontLight,
    ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColors.primaryContainerLight,
    //   centerTitle: true,
    //   titleTextStyle: TextStyle(
    //     fontSize: 18.sp,
    //     fontWeight: FontWeight.w600,
    //     color: AppColors.fontLight,
    //     fontFamily: "Montserrat",
    //   ),
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   hintStyle: TextStyle(
    //     fontSize: 15.sp,
    //     fontWeight: FontWeight.w500,
    //     color: AppColors.labelLight,
    //     fontFamily: "Montserrat",
    //   ),
    //   labelStyle: TextStyle(
    //     fontSize: 15.sp,
    //     fontWeight: FontWeight.w600,
    //     color: AppColors.labelLight,
    //     fontFamily: "Montserrat",
    //   ),
    //   fillColor: AppColors.backgroundLight,
    //   filled: true,
    //   border: UnderlineInputBorder(
    //     borderSide: BorderSide(color: AppColors.primaryLight, width: 2.w),
    //   ),
    //   focusedBorder: UnderlineInputBorder(
    //     borderSide: BorderSide(color: AppColors.primaryLight, width: 2.w),
    //   ),
    // ),
    // buttonTheme: const ButtonThemeData(
    //   buttonColor: AppColors.primaryLight,
    //   textTheme: ButtonTextTheme.primary,
    // ),
    // textTheme: TextTheme(
    //   headlineLarge: TextStyle(
    //     fontSize: 20.sp,
    //     fontWeight: FontWeight.w600,
    //     color: AppColors.fontLight,
    //     fontFamily: "Montserrat",
    //   ),
    //   headlineMedium: TextStyle(
    //     fontSize: 15.sp,
    //     fontWeight: FontWeight.w600,
    //     color: AppColors.fontLight,
    //     fontFamily: "Montserrat",
    //   ),
    //   headlineSmall: TextStyle(
    //     fontSize: 13.sp,
    //     fontWeight: FontWeight.w600,
    //     color: AppColors.fontLight,
    //     fontFamily: "Montserrat",
    //   ),
    //   bodyLarge: TextStyle(
    //     fontSize: 18.sp,
    //     fontWeight: FontWeight.w500,
    //     color: AppColors.fontLight,
    //     fontFamily: "Montserrat",
    //   ),
    //   bodyMedium: TextStyle(
    //     fontSize: 15.sp,
    //     fontWeight: FontWeight.w500,
    //     color: AppColors.fontLight,
    //     fontFamily: "Montserrat",
    //   ),
    //   bodySmall: TextStyle(
    //     fontSize: 13.sp,
    //     fontWeight: FontWeight.w500,
    //     color: AppColors.fontLight,
    //     fontFamily: "Montserrat",
    //   ),
    //   labelLarge: TextStyle(
    //     fontSize: 15.sp,
    //     fontWeight: FontWeight.w600,
    //     color: AppColors.labelLight,
    //     fontFamily: "Montserrat",
    //   ),
    //   labelMedium: TextStyle(
    //     fontSize: 13.sp,
    //     fontWeight: FontWeight.w500,
    //     color: AppColors.labelLight,
    //     fontFamily: "Montserrat",
    //   ),
    //   labelSmall: TextStyle(
    //     fontSize: 10.sp,
    //     fontWeight: FontWeight.w500,
    //     color: AppColors.labelLight,
    //     fontFamily: "Montserrat",
    //   ),
    // ),
  );

  // dark theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      surface: AppColors.backgroundDark,
      onSurface: AppColors.fontDark,
      primary: AppColors.primaryDark,
      primaryContainer: AppColors.primaryContainerDark,
      tertiary: AppColors.labelDark,
      error: AppColors.errorColor,
      onPrimaryContainer: AppColors.fontDark,
    ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColors.primaryContainerDark,
    //   centerTitle: true,
    //   titleTextStyle: TextStyle(
    //     fontSize: 18.sp,
    //     fontWeight: FontWeight.w600,
    //     color: AppColors.fontDark,
    //     fontFamily: "Montserrat",
    //   ),
    // ),
    // inputDecorationTheme: InputDecorationTheme(
    //   hintStyle: TextStyle(
    //     fontSize: 15.sp,
    //     fontWeight: FontWeight.w500,
    //     color: AppColors.labelDark,
    //     fontFamily: "Montserrat",
    //   ),
    //   labelStyle: TextStyle(
    //     fontSize: 15.sp,
    //     fontWeight: FontWeight.w600,
    //     color: AppColors.labelDark,
    //     fontFamily: "Montserrat",
    //   ),
    //   fillColor: AppColors.backgroundDark,
    //   filled: true,
    //   border: UnderlineInputBorder(
    //     borderSide: BorderSide(color: AppColors.primaryDark, width: 2.w),
    //   ),
    //   focusedBorder: UnderlineInputBorder(
    //     borderSide: BorderSide(color: AppColors.primaryDark, width: 2.w),
    //   ),
    // ),
    // buttonTheme: const ButtonThemeData(
    //   buttonColor: AppColors.primaryDark,
    //   textTheme: ButtonTextTheme.primary,
    // ),
    // textTheme: TextTheme(
    //   headlineLarge: TextStyle(
    //     fontSize: 20.sp,
    //     fontWeight: FontWeight.w600,
    //     color: AppColors.fontDark,
    //     fontFamily: "Montserrat",
    //   ),
    //   headlineMedium: TextStyle(
    //     fontSize: 15.sp,
    //     fontWeight: FontWeight.w600,
    //     color: AppColors.fontDark,
    //     fontFamily: "Montserrat",
    //   ),
    //   headlineSmall: TextStyle(
    //     fontSize: 13.sp,
    //     fontWeight: FontWeight.w600,
    //     color: AppColors.fontDark,
    //     fontFamily: "Montserrat",
    //   ),
    //   bodyLarge: TextStyle(
    //     fontSize: 18.sp,
    //     fontWeight: FontWeight.w500,
    //     color: AppColors.fontDark,
    //     fontFamily: "Montserrat",
    //   ),
    //   bodyMedium: TextStyle(
    //     fontSize: 15.sp,
    //     fontWeight: FontWeight.w500,
    //     color: AppColors.fontDark,
    //     fontFamily: "Montserrat",
    //   ),
    //   bodySmall: TextStyle(
    //     fontSize: 13.sp,
    //     fontWeight: FontWeight.w500,
    //     color: AppColors.fontDark,
    //     fontFamily: "Montserrat",
    //   ),
    //   labelLarge: TextStyle(
    //     fontSize: 15.sp,
    //     fontWeight: FontWeight.w600,
    //     color: AppColors.labelDark,
    //     fontFamily: "Montserrat",
    //   ),
    //   labelMedium: TextStyle(
    //     fontSize: 13.sp,
    //     fontWeight: FontWeight.w500,
    //     color: AppColors.labelDark,
    //     fontFamily: "Montserrat",
    //   ),
    //   labelSmall: TextStyle(
    //     fontSize: 10.sp,
    //     fontWeight: FontWeight.w500,
    //     color: AppColors.labelDark,
    //     fontFamily: "Montserrat",
    //   ),
    // ),
  );
}
