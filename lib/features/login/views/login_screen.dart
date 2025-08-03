import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shakti/core/constants/app_icons.dart';
import 'package:project_shakti/core/constants/app_strings.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/utils/sharedpref_helper.dart';
import 'package:project_shakti/core/utils/ui_helper.dart';
import 'package:project_shakti/core/widgets/custom_button.dart';
import 'package:project_shakti/core/widgets/custom_loading_indicator.dart';
import 'package:project_shakti/core/widgets/custom_text_field.dart';
import 'package:project_shakti/features/login/bloc/login_bloc.dart';
import 'package:project_shakti/features/login/bloc/login_event.dart';
import 'package:project_shakti/features/login/bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  final Function(ThemeMode)? onThemeChanged;

  const LoginScreen({super.key, this.onThemeChanged});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();

  final _formKey = GlobalKey<FormState>();

  // Add these controllers
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();

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
    _identifierController.dispose();
    _passwordController.dispose();

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
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
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

                      // Logo/Brand Section
                      _buildBrandSection(),

                      UIHelper.getVerticalSpace(UIHelper.paddingMedium),

                      // Welcome Text
                      _buildWelcomeSection(),

                      UIHelper.getVerticalSpace(UIHelper.paddingLarge),

                      // Login Form
                      // _buildLoginForm(brightness),
                      BlocConsumer<LoginBloc, LoginState>(
                        listener: (context, state) async {
                          if (state is LoginSuccess) {
                            _prefsHelper.saveToken(state.token ?? '');

                            print('Token saved: ${state.token}');
                            context.push('/bottom_nav');
                            UIHelper.showSnackBar(
                              context,
                              state.message,
                              isError: false,
                            );
                          } else if (state is LoginFailure) {
                            UIHelper.showSnackBar(
                              context,
                              state.message,
                              isError: true,
                            );
                          }
                        },
                        builder: (context, state) {
                          return Stack(
                            children: [
                              _buildLoginForm(brightness),
                              if (state is LoginLoading)
                                const Center(child: CustomLoadingIndicator()),
                            ],
                          );
                        },
                      ),

                      UIHelper.getVerticalSpace(UIHelper.paddingMedium),

                      // Social Login Section
                      _buildSocialLoginSection(brightness),

                      UIHelper.getVerticalSpace(UIHelper.paddingMedium),

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
    );
  }

  Widget _buildBrandSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteCommon,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Icon(
        AppIcons.bolt,
        size: 40,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Column(
      children: [
        Text(
          AppStrings.welcome,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Opacity(
          opacity: 0.8,
          child: Text(
            AppStrings.signInToContinue,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm(Brightness brightness) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(UIHelper.paddingLarge),
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
            CustomTextField(
              controller: _identifierController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email address';
                }
                return null;
              },
              labelText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              icon: Icons.email_outlined,
              textInputAction: TextInputAction.next,
            ),
            UIHelper.getVerticalSpace(UIHelper.paddingMedium),
            CustomTextField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              labelText: 'Password',
              obscureText: true,
              icon: Icons.lock_outline,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                ),
                child: Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            UIHelper.getVerticalSpace(UIHelper.paddingSmall),

            // CustomButton(
            //   text: AppStrings.loginButton,
            //   onPressed: () {
            //     Navigator.pushReplacementNamed(context, '/bottom_nav');
            //   },
            // ),
            CustomButton(
              text: AppStrings.loginButton,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(
                    LoginSubmittedEvent(
                      identifier: _identifierController.text,
                      password: _passwordController.text,
                    ),
                  );
                }
              },
            ),
          ],
        ),
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
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Or continue with',
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

        // First row of social buttons
        Row(
          children: [
            Expanded(
              child: _buildSocialButton(
                'Google',
                AppIcons.googleIcon,
                () {},
                brightness,
              ),
            ),
            UIHelper.getHorizontalSpace(UIHelper.paddingSmall),
            Expanded(
              child: _buildSocialButton(
                'Microsoft',
                AppIcons.microsoftIcon,
                () {},
                brightness,
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
                AppIcons.phoneIcon,
                () {},
                brightness,
              ),
            ),
            UIHelper.getHorizontalSpace(UIHelper.paddingSmall),
            Expanded(
              child: _buildSocialButton(
                'Apple',
                AppIcons.appleIcon,
                () {},
                brightness,
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
    VoidCallback onPressed,
    Brightness brightness,
  ) {
    return SizedBox(
      height: 50,
      child: OutlinedButton.icon(
        iconAlignment: IconAlignment.start,
        onPressed: onPressed,
        icon: SizedBox(width: 26, height: 26, child: Image.asset(icon)),
        label: Padding(
          padding: const EdgeInsets.only(left: UIHelper.paddingSmall),
          child: Text(
            text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
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
      ),
    );
  }

  Widget _buildSignUpSection(Brightness brightness) {
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
            AppStrings.newToShakti,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextButton(
            onPressed: () {
              context.push('/signup');
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              AppStrings.createAccount,
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
