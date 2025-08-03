import 'package:flutter/material.dart';
import 'package:project_shakti/features/safe_call/widgets/widgets.dart';

class SafeCall extends StatefulWidget {
  const SafeCall({super.key});

  @override
  State<SafeCall> createState() => _SafeCallState();
}

class _SafeCallState extends State<SafeCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Emergency Assist",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Divider(thickness: 1),
              const SizedBox(height: 30),
              const Text(
                "Immediate Emergency\nAssistance",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "Tap on a button below to connect\ninstantly with help.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 30),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    buildEmergencyTile(
                      context: context,
                      color: Colors.orange,
                      icon: Icons.local_police,
                      label: 'Police',
                    ),
                    buildEmergencyTile(
                      context: context,
                      color: Colors.blue,
                      icon: Icons.local_hospital,
                      label: 'Ambulance',
                    ),
                    buildEmergencyTile(
                      context: context,
                      color: Colors.deepOrange,
                      icon: Icons.support_agent,
                      label: 'Women Helpline',
                    ),
                    buildEmergencyTile(
                      context: context,
                      color: Colors.green,
                      icon: Icons.call,
                      label: 'Family Contact',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmergencyTile({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String label,
  }) {
    return GestureDetector(
      onTap: () {
        showCallConfirmationDialog(context, label);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 30),
                const SizedBox(height: 10),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Tap to connect",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
