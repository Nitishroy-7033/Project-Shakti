import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';

import 'package:project_shakti/core/theme/app_text_styles.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColor.accentBlueLight,
      scaffoldBackgroundColor: AppColor.backgroundLight,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.cardLight,
        foregroundColor: AppColor.primaryText(Brightness.light),
        elevation: 1,
        titleTextStyle: AppTextStyles.appBarTitle(Brightness.light),
        iconTheme: IconThemeData(color: AppColor.primaryText(Brightness.light)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.accentPink(Brightness.light),
          foregroundColor: AppColor.textPrimaryLight,
          textStyle: AppTextStyles.button(Brightness.light),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.accentBlue(Brightness.light),
          textStyle: AppTextStyles.button(Brightness.light),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.accentBlue(Brightness.light),
          textStyle: AppTextStyles.button(Brightness.light),
          side: BorderSide(color: AppColor.accentBlue(Brightness.light)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.cardLight,
        labelStyle: AppTextStyles.label(Brightness.light),
        hintStyle: AppTextStyles.caption(Brightness.light),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.secondaryText(Brightness.light),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.secondaryText(Brightness.light),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.accentBlue(Brightness.light)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.error(Brightness.light)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.error(Brightness.light)),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.heading1(Brightness.light),
        displayMedium: AppTextStyles.heading2(Brightness.light),
        titleMedium: AppTextStyles.subheading(Brightness.light),
        bodyLarge: AppTextStyles.body(Brightness.light),
        bodyMedium: AppTextStyles.bodyBold(Brightness.light),
        labelLarge: AppTextStyles.label(Brightness.light),
        bodySmall: AppTextStyles.caption(Brightness.light),
      ),
      colorScheme: ColorScheme.light(
        primary: AppColor.accentBlueLight,
        secondary: AppColor.accentPinkLight,
        background: AppColor.backgroundLight,
        surface: AppColor.cardLight,
        error: AppColor.errorLight,
        onPrimary: AppColor.textPrimaryLight,
        onSecondary: AppColor.textPrimaryLight,
        onBackground: AppColor.primaryText(Brightness.light),
        onSurface: AppColor.primaryText(Brightness.light),
        onError: AppColor.textPrimaryLight,
      ),
      cardTheme: CardThemeData(
        color: AppColor.cardLight,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      dividerTheme: DividerThemeData(
        color: AppColor.secondaryText(Brightness.light),
        thickness: 1,
      ),
      iconTheme: IconThemeData(color: AppColor.primaryText(Brightness.light)),
    );
  }

  // Dark Theme
  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColor.accentBlueDark,
      scaffoldBackgroundColor: AppColor.backgroundDark,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.cardDark,
        foregroundColor: AppColor.primaryText(Brightness.dark),
        elevation: 1,
        titleTextStyle: AppTextStyles.appBarTitle(Brightness.dark),
        iconTheme: IconThemeData(color: AppColor.primaryText(Brightness.dark)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.accentPink(Brightness.dark),
          foregroundColor: AppColor.textPrimaryDark,
          textStyle: AppTextStyles.button(Brightness.dark),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColor.accentBlue(Brightness.dark),
          textStyle: AppTextStyles.button(Brightness.dark),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColor.accentBlue(Brightness.dark),
          textStyle: AppTextStyles.button(Brightness.dark),
          side: BorderSide(color: AppColor.accentBlue(Brightness.dark)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.cardDark,
        labelStyle: AppTextStyles.label(Brightness.dark),
        hintStyle: AppTextStyles.caption(Brightness.dark),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.secondaryText(Brightness.dark),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.secondaryText(Brightness.dark),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.accentBlue(Brightness.dark)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.error(Brightness.dark)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.error(Brightness.dark)),
        ),
      ),
      colorScheme: ColorScheme.dark(
        primary: AppColor.accentBlueDark,
        secondary: AppColor.accentPinkDark,
        background: AppColor.backgroundDark,
        surface: AppColor.cardDark,
        error: AppColor.errorDark,
        onPrimary: AppColor.textPrimaryDark,
        onSecondary: AppColor.textPrimaryDark,
        onBackground: AppColor.primaryText(Brightness.dark),
        onSurface: AppColor.primaryText(Brightness.dark),
        onError: AppColor.textPrimaryDark,
      ),
      cardTheme: CardThemeData(
        color: AppColor.cardDark,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      dividerTheme: DividerThemeData(
        color: AppColor.secondaryText(Brightness.dark),
        thickness: 1,
      ),
      iconTheme: IconThemeData(color: AppColor.primaryText(Brightness.dark)),
    );
  }
}
