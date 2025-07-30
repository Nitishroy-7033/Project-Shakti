import 'package:flutter/material.dart';

class UIHelper {
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  UIHelper(pad);

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


static void showSnackBar(
  BuildContext context,
  String message, {
  bool isError = false,
  Duration duration = const Duration(seconds: 2),
}) {
  final backgroundColor = isError ? Colors.redAccent : Colors.green;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
      duration: duration,
    ),
  );
}


}
