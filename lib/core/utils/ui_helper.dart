import 'package:flutter/material.dart';

class UIHelper {
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  static EdgeInsets getPadding({
    double horizontal = paddingMedium,
    double vertical = paddingMedium,
  }) {
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }

  static SizedBox getVerticalSpace(double height) {
    return SizedBox(height: height);
  }

  static SizedBox getHorizontalSpace(double width) {
    return SizedBox(width: width);
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
