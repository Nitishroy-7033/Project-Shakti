import 'package:flutter/material.dart';
import 'package:project_shakti/core/constants/app_images.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/utils/ui_helper.dart';

class FakeCall extends StatelessWidget {
  const FakeCall({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          // Profile Image
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppImages.policePhoto),
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingSmall),
          // Call Status
          // Call Duration
          Text(
            "02:36",
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text("On Call", style: Theme.of(context).textTheme.bodySmall),
          UIHelper.getVerticalSpace(UIHelper.paddingSmall),
          // Contact Name
          Text("Police", style: Theme.of(context).textTheme.headlineLarge),
          // Emergency Number
          Text(
            "Emergency - 1091",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),

          const Spacer(),

          // Call Controls Container with increased height
          Container(
            height: 260,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
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
                      iconColor: Theme.of(context).colorScheme.onPrimary,
                      bgColor: Theme.of(context).colorScheme.primary,
                    ),
                    _CallButton(icon: Icons.more_horiz, label: "More"),
                  ],
                ),
                const SizedBox(height: 30),
                // End Call Button
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: AppColors.errorColor,
                      child: Icon(
                        Icons.call_end,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "End Call",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
        CircleAvatar(
          radius: 25,
          backgroundColor: bgColor ?? Theme.of(context).colorScheme.surface,
          child: Icon(
            icon,
            color:
                iconColor ?? Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ],
    );
  }
}
