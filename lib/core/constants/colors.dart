import 'package:flutter/material.dart';

class AppColor {
  // ----------------- Background Colors -----------------
  static const Color backgroundLight = Color(
    0xFFF9F9F9,
  ); // Light mode background
  static const Color backgroundDark = Color(0xFF1E1E1E); // Dark mode background

  // ----------------- Card Colors -----------------
  static const Color cardLight = Color(0xFFFFFFFF); // Light mode card
  static const Color cardDark = Color(0xFF2A2A2A); // Dark mode card

  // ----------------- Primary Text Colors -----------------
  static const Color textPrimaryLight = Color(
    0xFF2D2D2D,
  ); // Light mode primary text
  static const Color textPrimaryDark = Color(
    0xFFD3D3D3,
  ); // Dark mode primary text

  // ----------------- Secondary Text Colors -----------------
  static const Color textSecondaryLight = Color(
    0xFF757575,
  ); // Light mode secondary text
  static const Color textSecondaryDark = Color(
    0xFFB0B0B0,
  ); // Dark mode secondary text

  // ----------------- Accent Colors -----------------
  static const Color accentPinkLight = Color(0xFFFF6B8A); // Pink accent (light)
  static const Color accentPinkDark = Color(0xFFFF6B8A); // Pink accent (dark)

  static const Color accentBlueLight = Color(
    0xFF4DA8DA,
  ); // Blue secondary accent (light)
  static const Color accentBlueDark = Color(
    0xFF4DA8DA,
  ); // Blue secondary accent (dark)

  // ----------------- Success Colors -----------------
  static const Color successLight = Color(
    0xFF4CAF50,
  ); // Light mode success (green)
  static const Color successDark = Color(
    0xFF4CAF50,
  ); // Dark mode success (green)

  // ----------------- Error Colors -----------------
  static const Color errorLight = Color(0xFFEF5350); // Light mode error (red)
  static const Color errorDark = Color(0xFFEF5350); // Dark mode error (red)

  // ----------------- Getters for Theme Mode -----------------
  static Color background(Brightness brightness) =>
      brightness == Brightness.dark ? backgroundDark : backgroundLight;

  static Color card(Brightness brightness) =>
      brightness == Brightness.dark ? cardDark : cardLight;

  static Color primaryText(Brightness brightness) =>
      brightness == Brightness.dark ? textPrimaryDark : textPrimaryLight;

  static Color secondaryText(Brightness brightness) =>
      brightness == Brightness.dark ? textSecondaryDark : textSecondaryLight;

  static Color accentPink(Brightness brightness) =>
      brightness == Brightness.dark ? accentPinkDark : accentPinkLight;

  static Color accentBlue(Brightness brightness) =>
      brightness == Brightness.dark ? accentBlueDark : accentBlueLight;

  static Color success(Brightness brightness) =>
      brightness == Brightness.dark ? successDark : successLight;

  static Color error(Brightness brightness) =>
      brightness == Brightness.dark ? errorDark : errorLight;
}
