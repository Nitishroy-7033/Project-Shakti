import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/theme/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _bouncingController;
  late AnimationController _scaleController;
  late AnimationController _rotationController;
  late AnimationController _fadeController;

  late Animation<double> _bounceAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _sloganFadeAnimation;

  @override
  void initState() {
    super.initState();

    // Bouncing animation for heart
    _bouncingController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Scale animation for zoom in/out effect
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Rotation animation for spinning effect
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Fade animation for text
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Bouncing animation with elastic effect
    _bounceAnimation = Tween<double>(begin: 0.0, end: -30.0).animate(
      CurvedAnimation(parent: _bouncingController, curve: Curves.elasticOut),
    );

    // Scale animation for zoom effect
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    // Rotation animation for spinning heart
    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeInOut),
    );

    // Fade animation for app name
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Interval(0.0, 0.7, curve: Curves.easeInOut),
      ),
    );

    // Fade animation for slogan (delayed)
    _sloganFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Start animations
    _startAnimations();

    // Navigate after delay
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  void _startAnimations() {
    // Start bouncing repeatedly
    _bouncingController.repeat(reverse: true);

    // Start scaling repeatedly
    _scaleController.repeat(reverse: true);

    // Start rotation repeatedly
    _rotationController.repeat(reverse: true);

    // Start fade animation
    _fadeController.forward();
  }

  @override
  void dispose() {
    _bouncingController.dispose();
    _scaleController.dispose();
    _rotationController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColor.accentPink(brightness).withOpacity(0.9),
              AppColor.accentPink(brightness).withOpacity(0.6),
              AppColor.background(brightness).withOpacity(0.4),
              AppColor.accentBlue(brightness).withOpacity(0.1),
            ],
            stops: const [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Heart Icon
                AnimatedBuilder(
                  animation: Listenable.merge([
                    _bouncingController,
                    _scaleController,
                    _rotationController,
                  ]),
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _bounceAnimation.value),
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Transform.rotate(
                          angle: _rotationAnimation.value,
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.accentPink(
                                    brightness,
                                  ).withOpacity(0.4),
                                  blurRadius: 20,
                                  spreadRadius: 5,
                                ),
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.favorite,
                              size: 80,
                              color: AppColor.accentPink(brightness),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 50),

                // Animated App Name
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      Text(
                        'SHAKTI',
                        style: AppTextStyles.heading1(brightness).copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 42,
                          letterSpacing: 3,

                          shadows: [
                            Shadow(
                              color: AppColor.accentPink(
                                brightness,
                              ).withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(2, 2),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Women Safety App',
                        style: AppTextStyles.subheading(brightness).copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,

                          letterSpacing: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 60),

                // Animated Slogan
                FadeTransition(
                  opacity: _sloganFadeAnimation,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          '💪 सशक्त महिला, सुरक्षित समाज',
                          style: AppTextStyles.body(brightness).copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,

                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Empowered Women, Safer Society',
                          style: AppTextStyles.caption(brightness).copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,

                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // Loading indicator
                FadeTransition(
                  opacity: _sloganFadeAnimation,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColor.accentPink(brightness).withOpacity(0.8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'Loading...',
                        style: AppTextStyles.caption(
                          brightness,
                        ).copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Add this extension for better animation curves
extension AnimationControllerExtension on AnimationController {
  void repeatWithDelay(Duration delay, {bool reverse = false}) {
    Future.delayed(delay, () {
      repeat(reverse: reverse);
    });
  }
}
