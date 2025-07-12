import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/theme/app_text_styles.dart';
import 'package:project_shakti/core/utils/ui_helper.dart';
import 'package:project_shakti/core/widgets/custom_button.dart';
import 'package:project_shakti/core/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  final Function(ThemeMode)? onThemeChanged;

  const LoginScreen({super.key, this.onThemeChanged});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.elasticOut),
    );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColor.accentPink(brightness).withOpacity(0.1),
            AppColor.background(brightness),
            AppColor.accentBlue(brightness).withOpacity(0.05),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.08,
                    vertical: UIHelper.paddingMedium,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo/Brand Section
                        _buildBrandSection(brightness),

                        UIHelper.getVerticalSpace(UIHelper.paddingLarge * 1.5),

                        // Welcome Text
                        _buildWelcomeSection(brightness),

                        UIHelper.getVerticalSpace(UIHelper.paddingLarge),

                        // Login Form
                        _buildLoginForm(brightness),

                        UIHelper.getVerticalSpace(UIHelper.paddingLarge),

                        // Social Login Section
                        _buildSocialLoginSection(brightness),

                        UIHelper.getVerticalSpace(UIHelper.paddingLarge),

                        // Sign Up Link
                        _buildSignUpSection(brightness),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandSection(Brightness brightness) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColor.accentPink(brightness).withOpacity(0.2),
            AppColor.accentBlue(brightness).withOpacity(0.2),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.accentPink(brightness).withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Icon(
        Icons.bolt_rounded,
        size: 48,
        color: AppColor.accentPink(brightness),
      ),
    );
  }

  Widget _buildWelcomeSection(Brightness brightness) {
    return Column(
      children: [
        Text(
          'Welcome Back',
          style: AppTextStyles.heading1(
            brightness,
          ).copyWith(fontWeight: FontWeight.w800, letterSpacing: -0.5),
          textAlign: TextAlign.center,
        ),
        UIHelper.getVerticalSpace(UIHelper.paddingSmall),
        Text(
          'Sign in to continue your journey',
          style: AppTextStyles.subheading(brightness).copyWith(
            color: AppTextStyles.subheading(brightness).color?.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildLoginForm(Brightness brightness) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:
            brightness == Brightness.dark
                ? Colors.white.withOpacity(0.05)
                : Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color:
              brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          CustomTextField(
            labelText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email_outlined,
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          CustomTextField(
            labelText: 'Password',
            obscureText: true,
            prefixIcon: Icons.lock_outline,
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingSmall),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
              child: Text(
                'Forgot Password?',
                style: AppTextStyles.caption(brightness).copyWith(
                  color: AppColor.accentBlue(brightness),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Sign In',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/profile');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLoginSection(Brightness brightness) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: AppTextStyles.body(brightness).color?.withOpacity(0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Or continue with',
                style: AppTextStyles.caption(brightness).copyWith(
                  color: AppTextStyles.caption(
                    brightness,
                  ).color?.withOpacity(0.6),
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: AppTextStyles.body(brightness).color?.withOpacity(0.3),
              ),
            ),
          ],
        ),
        UIHelper.getVerticalSpace(UIHelper.paddingMedium),

        // First row of social buttons
        Row(
          children: [
            Expanded(
              child: _buildSocialButton(
                'Google',
                Icons.g_mobiledata,
                Colors.red,
                brightness,
                () {},
              ),
            ),
            UIHelper.getHorizontalSpace(UIHelper.paddingSmall),
            Expanded(
              child: _buildSocialButton(
                'Apple',
                Icons.apple,
                Colors.black,
                brightness,
                () {},
              ),
            ),
          ],
        ),

        UIHelper.getVerticalSpace(UIHelper.paddingSmall),

        // Second row of social buttons
        Row(
          children: [
            Expanded(
              child: _buildSocialButton(
                'Phone',
                Icons.phone_outlined,
                Colors.green,
                brightness,
                () {},
              ),
            ),
            UIHelper.getHorizontalSpace(UIHelper.paddingSmall),
            Expanded(
              child: _buildSocialButton(
                'Microsoft',
                Icons.business,
                Colors.blue,
                brightness,
                () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(
    String text,
    IconData icon,
    Color iconColor,
    Brightness brightness,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      height: 52,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20, color: iconColor),
        label: Text(
          text,
          style: AppTextStyles.button(
            brightness,
          ).copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color:
                brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.2)
                    : Colors.black.withOpacity(0.1),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor:
              brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.02)
                  : Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _buildSignUpSection(Brightness brightness) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:
              brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.05),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'New to Shakti? ',
            style: AppTextStyles.body(brightness).copyWith(
              color: AppTextStyles.body(brightness).color?.withOpacity(0.8),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Create Account',
              style: AppTextStyles.button(brightness).copyWith(
                color: AppColor.accentBlue(brightness),
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: AppColor.accentBlue(brightness),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
