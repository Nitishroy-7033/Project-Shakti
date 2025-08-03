import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_shakti/features/safe_call/views/on_tap_screen/ambulance_screen.dart';
import 'package:project_shakti/features/safe_call/views/on_tap_screen/family_contact.dart';
import 'dart:math';

import 'package:project_shakti/features/safe_call/views/on_tap_screen/police_screen.dart';
import 'package:project_shakti/features/safe_call/views/on_tap_screen/women_helpline.dart';

void showCallConfirmationDialog(BuildContext context, String label) {
  const int totalSeconds = 10;
  int remainingSeconds = totalSeconds;
  late Timer timer;
  late StateSetter updateState;

  void navigateToCallingScreen() {
    if (timer.isActive) timer.cancel();
    Navigator.of(context, rootNavigator: true).pop();

    // Navigate to the correct screen based on label
    if (label == 'Police') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PoliceScreen()),
      );
    } else if (label == 'Ambulance') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AmbulanceScreen()),
      );
    } else if (label == 'Women Helpline') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const WomenHelplineScreen()),
      );
    } else if (label == 'Family Contact') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const FamilyContactScreen()),
      );
    }
  }

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      timer = Timer.periodic(Duration(seconds: 1), (t) {
        if (remainingSeconds > 0) {
          remainingSeconds--;
          updateState(() {});
        } else {
          t.cancel();
          navigateToCallingScreen();
        }
      });

      return StatefulBuilder(
        builder: (context, setState) {
          updateState = setState;

          double progress = (totalSeconds - remainingSeconds) / totalSeconds;

          return AlertDialog(
            title: Text('Calling Confirmation'),
            content: SizedBox(
              height: 120,
              width: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 8,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  Text(
                    "$remainingSeconds",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (timer.isActive) timer.cancel();
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: navigateToCallingScreen,
                child: Text('Continue'),
              ),
            ],
          );
        },
      );
    },
  ).then((_) {
    if (timer.isActive) timer.cancel();
  });
}
