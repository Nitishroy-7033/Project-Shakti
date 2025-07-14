import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'circle_progress_painter.dart';

class TripTimeoutPopup extends StatefulWidget {
  const TripTimeoutPopup({super.key});

  @override
  TripTimeoutPopupState createState() => TripTimeoutPopupState();
}

class TripTimeoutPopupState extends State<TripTimeoutPopup> {
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

  void _onRetry() {
    if (!mounted) return;
    setState(() {
      _counter = _total;
    });
    _startTimer();
  }

  void _onEndTrip() {
    if (mounted) {
      Navigator.of(context).pop(); // ✅ Just close the dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_counter / _total).clamp(0.0, 1.0);

    return CupertinoAlertDialog(
      content: Column(
        children: [
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
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 12),
                onPressed: _onRetry,
                child: Text("Retry"),
              ),
              CupertinoButton(
                padding: EdgeInsets.symmetric(horizontal: 12),
                onPressed: _onEndTrip,
                child: Text("End Trip"),
              ),
             
            ],
          ),
        ],
      ),
    );
  }
}