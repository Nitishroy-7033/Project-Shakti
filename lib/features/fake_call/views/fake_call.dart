import 'package:flutter/material.dart';

class FakeCall extends StatelessWidget {
  const FakeCall({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
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
            const Text(
              "On Call",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 5),

            // Contact Name
            const Text(
              "Police",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),

            // Emergency Number
            const Text(
              "Emergency - 1091",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 5),

            // Call Duration
            const Text(
              "0:00",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const Spacer(),

            // Call Controls Container with increased height
            Container(
              height: size.height * 0.35,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: const Offset(0, -2),
                  ),
                ],
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
                        bgColor: Colors.deepPurple,
                      ),
                      _CallButton(icon: Icons.more_horiz, label: "More"),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // End Call Button
                  Column(
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.red,
                        child: Icon(Icons.call_end, color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text("End Call", style: TextStyle(fontSize: 16)),
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
        CircleAvatar(
          radius: 25,
          backgroundColor: bgColor ?? Colors.grey.shade200,
          child: Icon(icon, color: iconColor ?? Colors.black),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
