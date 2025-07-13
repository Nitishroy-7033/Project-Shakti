import 'package:flutter/material.dart';
import 'package:project_shakti/core/constants/app_icons.dart';
import 'package:project_shakti/core/constants/app_strings.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
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
                      UIHelper.getVerticalSpace(UIHelper.paddingLarge),
                      // Welcome Section
                      _buildWelcomeSection(brightness),

                      UIHelper.getVerticalSpace(UIHelper.paddingLarge),

                      // SignUp Form
                      _buildSignUpForm(brightness),

                      UIHelper.getVerticalSpace(UIHelper.paddingMedium),

                      // Social SignUp Section
                      _buildSocialSignUpSection(brightness),

                      UIHelper.getVerticalSpace(UIHelper.paddingMedium),

                      // Login Link
                      _buildLoginSection(brightness),

                      UIHelper.getVerticalSpace(UIHelper.paddingLarge),
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
      padding: const EdgeInsets.all(UIHelper.paddingLarge),
      decoration: BoxDecoration(
        color:
            brightness == Brightness.dark
                ? AppColors.whiteCommon.withValues(alpha: 0.05)
                : AppColors.whiteCommon.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color:
              brightness == Brightness.dark
                  ? AppColors.whiteCommon.withValues(alpha: 0.1)
                  : AppColors.blackCommon.withValues(alpha: 0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackCommon.withValues(alpha: 0.05),
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
                  icon: Icons.person_outline_rounded,
                  textInputAction: TextInputAction.next,
                ),
              ),
              UIHelper.getHorizontalSpace(UIHelper.paddingSmall),
              Expanded(
                child: CustomTextField(
                  labelText: 'Last Name',
                  keyboardType: TextInputType.name,
                  icon: Icons.person_outline_rounded,
                  textInputAction: TextInputAction.next,
                ),
              ),
            ],
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          CustomTextField(
            labelText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email_outlined,
            textInputAction: TextInputAction.next,
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          CustomTextField(
            labelText: 'Phone Number',
            keyboardType: TextInputType.phone,
            icon: Icons.call_outlined,
            textInputAction: TextInputAction.next,
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          CustomTextField(
            labelText: 'Password',
            obscureText: true,
            icon: Icons.lock_outline,
            textInputAction: TextInputAction.next,
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          CustomTextField(
            labelText: 'Confirm Password',
            obscureText: true,
            icon: Icons.lock_outline,
            textInputAction: TextInputAction.done,
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingSmall),

          // Terms and Conditions
          Row(
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
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      children: [
                        const TextSpan(text: 'I agree to the '),
                        TextSpan(
                          text: 'Terms of Service',
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: Theme.of(
                            context,
                          ).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          UIHelper.getVerticalSpace(UIHelper.paddingMedium),
          CustomButton(
            text: 'Create Account',
            onPressed:
                _acceptTerms
                    ? () {
                      Navigator.pushReplacementNamed(context, '/splash');
                    }
                    : null,
            isEnabled: _acceptTerms,
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
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Or Sign Up with',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
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
                AppIcons.googleIcon,
                brightness,
                () {},
              ),
            ),
            UIHelper.getHorizontalSpace(UIHelper.paddingSmall),
            Expanded(
              child: _buildSocialButton(
                'Apple',
                AppIcons.appleIcon,
                brightness,
                () {},
              ),
            ),
            UIHelper.getHorizontalSpace(UIHelper.paddingSmall),
            Expanded(
              child: _buildSocialButton(
                'Microsoft',
                AppIcons.microsoftIcon,
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
    String icon,
    Brightness brightness,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color:
                brightness == Brightness.dark
                    ? AppColors.whiteCommon.withValues(alpha: 0.1)
                    : AppColors.blackCommon.withValues(alpha: 0.05),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor:
              brightness == Brightness.dark
                  ? AppColors.whiteCommon.withValues(alpha: 0.02)
                  : AppColors.whiteCommon.withValues(alpha: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20, height: 20, child: Image.asset(icon)),
            const SizedBox(height: 2),
            Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
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
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              brightness == Brightness.dark
                  ? AppColors.whiteCommon.withValues(alpha: 0.1)
                  : AppColors.blackCommon.withValues(alpha: 0.05),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.alreadyHaveAccount,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
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
              AppStrings.loginButton,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
