import 'dart:async';
import 'package:flutter/material.dart';

class SafetyTimerAlert extends StatefulWidget {
  const SafetyTimerAlert({Key? key}) : super(key: key);

  @override
  State<SafetyTimerAlert> createState() => _SafetyTimerAlertState();
}

class _SafetyTimerAlertState extends State<SafetyTimerAlert> {
  Duration _time = const Duration(minutes: 5);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_time.inSeconds == 0) {
        timer.cancel();
        Navigator.pop(context);
      } else {
        setState(() {
          _time = Duration(seconds: _time.inSeconds - 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String minutes =
        _time.inMinutes.remainder(60).toString().padLeft(2, '0');
    final String seconds =
        _time.inSeconds.remainder(60).toString().padLeft(2, '0');

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      contentPadding: const EdgeInsets.all(16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top Row: Icon + Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.timer_outlined, size: 20, color: Colors.blue),
              SizedBox(width: 6),
              Text(
                "Safety Timer",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Timer Text
          Text(
            "$minutes:$seconds",
            style: const TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 4),

          // Subtext
          const Text(
            "Countdown to next check-in",
            style: TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 16),

          // SOS - Emergency
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.phone_in_talk, color: Colors.black54, size: 18),
              SizedBox(width: 6),
              Text(
                "SOS - Emergency",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(height: 1, color: Colors.black26),
          const SizedBox(height: 12),

          // Share Live Location Button
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black87,
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            icon: const Icon(Icons.share_outlined, size: 18),
            label: const Text(
              "Share Live Location",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
     ),
);
}
}