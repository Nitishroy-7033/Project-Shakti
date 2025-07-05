import 'package:flutter/material.dart';
import 'package:project_shakti/core/constants/app_icons.dart';
import 'package:project_shakti/core/constants/app_strings.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/theme/app_text_styles.dart';
import 'package:project_shakti/core/utils/ui_helper.dart';
import 'package:project_shakti/core/widgets/custom_button.dart';
import 'package:project_shakti/core/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  final Function(ThemeMode)? onThemeChanged;

  const SignUpScreen({super.key, this.onThemeChanged});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _acceptTerms = false;

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

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.9),
                Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                Theme.of(context).colorScheme.surface.withValues(alpha: 0.1),
              ],
              stops: const [0.0, 0.3, 1.0],
            ),
          ),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: UIHelper.paddingLarge,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UIHelper.getVerticalSpace(UIHelper.paddingMedium),
                      // Welcome Section
                      _buildWelcomeSection(brightness),

                      // UIHelper.getVerticalSpace(UIHelper.paddingLarge),

                      // SignUp Form
                      _buildSignUpForm(brightness),

                      // UIHelper.getVerticalSpace(UIHelper.paddingLarge),

                      // Social SignUp Section
                      _buildSocialSignUpSection(brightness),

                      // UIHelper.getVerticalSpace(UIHelper.paddingLarge),

                      // Login Link
                      _buildLoginSection(brightness),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeSection(Brightness brightness) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.whiteCommon,
            boxShadow: [
              BoxShadow(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Icon(
            AppIcons.addPerson,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        UIHelper.getVerticalSpace(UIHelper.paddingMedium),
        Text(
          AppStrings.createAccount,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Opacity(
          opacity: 0.8,
          child: Text(
            AppStrings.joinToShakti,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpForm(Brightness brightness) {
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
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: 'First Name',
                  keyboardType: TextInputType.name,
                  // prefixIcon: Icons.person_outline,
                ),
              ),
              UIHelper.getHorizontalSpace(UIHelper.paddingSmall),
              Expanded(
                child: CustomTextField(
                  labelText: 'Last Name',
                  keyboardType: TextInputType.name,
                  // prefixIcon: Icons.person_outline,
                ),
              ),
            ],
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          CustomTextField(
            labelText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            // prefixIcon: Icons.email_outlined,
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          CustomTextField(
            labelText: 'Phone Number',
            keyboardType: TextInputType.phone,
            // prefixIcon: Icons.phone_outlined,
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          CustomTextField(
            labelText: 'Password',
            obscureText: true,
            // prefixIcon: Icons.lock_outline,
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          CustomTextField(
            labelText: 'Confirm Password',
            obscureText: true,
            // prefixIcon: Icons.lock_outline,
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),

          // Terms and Conditions
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color:
                  brightness == Brightness.dark
                      ? Colors.white.withOpacity(0.02)
                      : Colors.black.withOpacity(0.02),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: _acceptTerms,
                  onChanged: (value) {
                    setState(() {
                      _acceptTerms = value ?? false;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyles.caption(brightness),
                        children: [
                          const TextSpan(text: 'I agree to the '),
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              // color: AppColor.accentBlue(brightness),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              // color: AppColor.accentBlue(brightness),
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
              text: 'Create Account',
              onPressed:
                  _acceptTerms
                      ? () {
                        Navigator.pushReplacementNamed(context, '/profile');
                      }
                      : null,
              isEnabled: _acceptTerms,
              // style: ElevatedButton.styleFrom(
              //   padding: const EdgeInsets.symmetric(vertical: 16),
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialSignUpSection(Brightness brightness) {
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
                'Or sign up with',
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

        // Social buttons in horizontal layout
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
            UIHelper.getHorizontalSpace(UIHelper.paddingSmall),
            Expanded(
              child: _buildSocialButton(
                'LinkedIn',
                Icons.business_center,
                Colors.blue.shade700,
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
    return Container(
      height: 48,
      child: OutlinedButton(
        onPressed: onPressed,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: iconColor),
            const SizedBox(height: 2),
            Text(
              text,
              style: AppTextStyles.caption(
                brightness,
              ).copyWith(fontSize: 10, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginSection(Brightness brightness) {
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
            'Already have an account? ',
            style: AppTextStyles.body(brightness).copyWith(
              color: AppTextStyles.body(brightness).color?.withOpacity(0.8),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              'Sign In',
              style: AppTextStyles.button(brightness).copyWith(
                // color: AppColor.accentPink(brightness),
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                // decorationColor: AppColor.accentPink(brightness),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
