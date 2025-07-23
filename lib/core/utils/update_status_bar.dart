import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void updateStatusBar(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;
  WidgetsBinding.instance.addPostFrameCallback((_) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: colorScheme.surface,
        statusBarBrightness:
            colorScheme.brightness == Brightness.light
                ? Brightness.dark
                : Brightness.light,
      ),
    );
  });
}
