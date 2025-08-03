import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/theme/app_text_styles.dart';

class FamilyContactScreen extends StatelessWidget {
  const FamilyContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),

            // Profile Image
            CircleAvatar(
              radius: size.width * 0.15,
              backgroundImage: AssetImage("assets/images/police.png"),
            ),
            const SizedBox(height: 20),

            // Call Status
            Text(
              "On Call",
              style: AppTextStyles.subheading(Theme.of(context).brightness),
            ),
            const SizedBox(height: 5),

            // Contact Name
            Text(
              "Home",
              style: AppTextStyles.heading1(Theme.of(context).brightness),
            ),
            const SizedBox(height: 5),

            // Emergency Number
            Text(
              "Emergency - 1091",
              style: AppTextStyles.subheading(Theme.of(context).brightness),
            ),
            const SizedBox(height: 5),

            // Call Duration
            Text(
              "0:00",
              style: AppTextStyles.subheading(Theme.of(context).brightness),
            ),

            const Spacer(),

            // Call Controls Container with increased height
            Container(
              height: size.height * 0.35,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 30,
                    runSpacing: 20,
                    children: [
                      _CallButton(icon: Icons.dialpad, label: "Keypad"),
                      _CallButton(icon: Icons.mic_off, label: "Mute"),
                      _CallButton(
                        icon: Icons.volume_up,
                        label: "Speaker",
                        iconColor: Colors.white,
                        bgColor:
                            Theme.of(context).brightness == Brightness.light
                                ? AppColors.primaryLight
                                : AppColors.labelDark,
                      ),
                      _CallButton(icon: Icons.more_horiz, label: "More"),
                    ],
                  ),
                  const SizedBox(height: 50),

                  // End Call Button
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.call_end, color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "End Call",
                        style: AppTextStyles.subheading(
                          Theme.of(context).brightness,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CallButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;
  final Color? bgColor;

  const _CallButton({
    required this.icon,
    required this.label,
    this.iconColor,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 25, child: Icon(icon)),
        const SizedBox(height: 8),
        Text(
          label,
          style: AppTextStyles.subheading(Theme.of(context).brightness),
        ),
      ],
    );
  }
}
