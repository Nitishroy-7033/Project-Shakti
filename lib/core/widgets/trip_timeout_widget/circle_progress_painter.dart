import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleProgressPainter extends CustomPainter {
  final double progress;

  CircleProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 14;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width / 2) - strokeWidth / 2;

    Paint base = Paint()
      ..color = CupertinoColors.systemGrey.withOpacity(0.3)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Paint arc = Paint()
      ..color = CupertinoColors.systemRed
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, base);

    double angle = 2 * 3.1416 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.1416 / 2,
      angle,
      false,
      arc,
    );
  }

  @override
  bool shouldRepaint(CircleProgressPainter oldDelegate) =>
      oldDelegate.progress != progress;
}