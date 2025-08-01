import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:project_shakti/core/theme/app_text_styles.dart';
import 'circle_progress_painter.dart';
import 'package:flutter/material.dart';

class TripTimeOutPopup extends StatefulWidget {
  const TripTimeOutPopup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TripTimeOutPopupState createState() => _TripTimeOutPopupState();
}

class _TripTimeOutPopupState extends State<TripTimeOutPopup> {
  int _counter = 60;
  final int _total = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        timer.cancel();
        if (mounted) {
          Navigator.of(context).pop(); // Auto-close
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onSafe() {
    Navigator.of(context).pop();
  }

  void _onExtend() {
    setState(() {
      _counter += 10;
      if (_counter > _total) _counter = _total;
    });
  }

  void _onSOS() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_counter / _total).clamp(0.0, 1.0);

    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: 330, // 💡 Set your desired width here
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.9),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Checkpoint",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(height: 16),
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 1.0, end: progress),
                  duration: Duration(milliseconds: 500),
                  builder: (context, value, child) {
                    return CustomPaint(
                      painter: CircleProgressPainter(value),
                      child: Container(
                        width: 150,
                        height: 150,
                        alignment: Alignment.center,
                        child: Text(
                          '$_counter',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                Text(
                  "You have reached a checkpoint. Please confirm your status or take an action below.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      onPressed: _onSafe,
                      child: Text(
                        "I AM SAFE",
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold), 
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      onPressed: _onExtend,
                      child: Text(
                        "EXTEND 10 MIN",
                        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,), 
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      onPressed: _onSOS,
                      child: Text(
                        "SOS",
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold), 
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
