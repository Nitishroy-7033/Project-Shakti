import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';

class SoshelpScreen extends StatefulWidget {
  const SoshelpScreen({super.key});

  @override
  _SoshelpScreenState createState() => _SoshelpScreenState();
}

class _SoshelpScreenState extends State<SoshelpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // Optimized calculation method
  double _calculateImageRadius(double circleSize, double progress) {
    double baseRadius = circleSize * 0.15;
    return baseRadius + (progress * baseRadius * 1.2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryContainerLight,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;
            double circleSize = screenWidth * 0.6;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.03,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Signal',
                        style: TextStyle(
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.bold,
                          color: AppColors.fontLight,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.04,
                          vertical: screenHeight * 0.008,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryLight.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.diamond,
                              color: AppColors.secondaryLight,
                              size: screenWidth * 0.045,
                            ),
                            SizedBox(width: screenWidth * 0.015),
                            Text(
                              'Premium',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                color: AppColors.secondaryLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                    top: screenHeight * 0.01,
                  ),
                  child: Text(
                    'Use an alert signal to reach the attention of others',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: screenWidth * 0.042,
                      color: AppColors.fontLight,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.06),
                Expanded(
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: AnimatedCenterCirclePainter(
                            circleSize: circleSize,
                            progress: _animation.value,
                            primaryColor: AppColors.primaryLight,
                            labelColor: AppColors.labelLight,
                          ),
                          child: Container(
                            width: circleSize * 0.6,
                            height: circleSize * 0.6,
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: AppColors.primaryLight,
                                backgroundImage: AssetImage(
                                  'assets/images/avtar.png',
                                ),
                                radius: _calculateImageRadius(
                                  circleSize,
                                  _animation.value,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AnimatedCenterCirclePainter extends CustomPainter {
  final double circleSize;
  final double progress;
  final Color primaryColor;
  final Color labelColor;

  AnimatedCenterCirclePainter({
    required this.circleSize,
    required this.progress,
    required this.primaryColor,
    required this.labelColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Pre-calculate values for better performance
    double baseRadius = circleSize * 0.3;
    double animatedRadius = baseRadius + (progress * baseRadius * 0.3);

    // Reuse paint objects
    final paintCenter =
        Paint()
          ..color = primaryColor
          ..style = PaintingStyle.fill;

    // Draw the main animated circle
    canvas.drawCircle(center, animatedRadius, paintCenter);

    // Optimized border circles - reduced to 2 for better performance
    for (int i = 0; i < 2; i++) {
      double borderProgress = (progress + i * 0.5) % 1.0;
      double borderRadius = baseRadius + (borderProgress * baseRadius * 1.0);
      double opacity = (1.0 - borderProgress) * 0.6;

      final paintBorder =
          Paint()
            ..color = primaryColor.withOpacity(opacity)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3.0;

      canvas.drawCircle(center, borderRadius, paintBorder);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Only repaint if progress changed significantly
    if (oldDelegate is AnimatedCenterCirclePainter) {
      return (progress - oldDelegate.progress).abs() > 0.01;
    }
    return true;
  }
}
