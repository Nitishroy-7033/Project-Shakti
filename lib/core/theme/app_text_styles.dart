import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';

class AppTextStyles {
  // App Bar Title
  static TextStyle appBarTitle(Brightness brightness) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: AppColor.primaryText(brightness),
  );

  // Heading 1 (Large titles, e.g., page headers)
  static TextStyle heading1(Brightness brightness) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: AppColor.primaryText(brightness),
  );

  // Heading 2 (Section headers)
  static TextStyle heading2(Brightness brightness) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: AppColor.primaryText(brightness),
  );
  // Heading 3 (Subsection headers)
  static TextStyle heading3(Brightness brightness) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColor.primaryText(brightness),
  );

  // Subheading (Secondary titles)
  static TextStyle subheading(Brightness brightness) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: AppColor.secondaryText(brightness),
  );

  // Body Text (Regular)
  static TextStyle body(Brightness brightness) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColor.primaryText(brightness),
  );

  // Body Text Bold
  static TextStyle bodyBold(Brightness brightness) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: AppColor.primaryText(brightness),
  );

  // Caption (Small text, e.g., for descriptions)
  static TextStyle caption(Brightness brightness) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 12,
    color: AppColor.secondaryText(brightness),
  );

  // Button Text
  static TextStyle button(Brightness brightness) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColor.secondaryText(brightness), // Fixed for contrast on buttons
  );

  // Label (e.g., form field labels)
  static TextStyle label(Brightness brightness) => TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: AppColor.primaryText(brightness),
  );
}
