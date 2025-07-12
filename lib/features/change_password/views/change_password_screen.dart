import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/theme/app_text_styles.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> with SingleTickerProviderStateMixin {
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      backgroundColor: brightness == Brightness.light
          ? AppColors.backgroundLight
          : AppColors.backgroundDark,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    Flexible(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: constraints.maxHeight - 80),
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Header
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: brightness == Brightness.light
                                              ? AppColors.primaryContainerLight
                                              : AppColors.primaryContainerDark,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.arrow_back,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Change Password',
                                      style: AppTextStyles.appBarTitle(brightness),
                                    ),
                                    const Spacer(flex: 2),
                                  ],
                                ),

                                const SizedBox(height: 32),

                                // Current Password
                                _buildPasswordField(
                                  label: "Current Password",
                                  controller: _currentController,
                                  obscure: _obscureCurrent,
                                  onToggle: () => setState(() => _obscureCurrent = !_obscureCurrent),
                                  hintText: "Enter your current password",
                                  brightness: brightness,
                                ),

                                const SizedBox(height: 12),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle forgot password
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: AppTextStyles.caption(brightness).copyWith(
                                        color: brightness == Brightness.light
                                            ? AppColors.secondaryLight
                                            : AppColors.secondaryDark,
                                      ),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 24),

                                // OR Divider
                                Row(
                                  children: [
                                    Expanded(
                                      child: Divider(
                                        color: brightness == Brightness.light
                                            ? AppColors.labelLight
                                            : AppColors.labelDark,
                                        thickness: 0.5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        "OR",
                                        style: AppTextStyles.caption(brightness).copyWith(
                                          color: brightness == Brightness.light
                                              ? AppColors.labelLight
                                              : AppColors.labelDark,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                        color: brightness == Brightness.light
                                            ? AppColors.labelLight
                                            : AppColors.labelDark,
                                        thickness: 0.5,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 24),

                                // New Password
                                _buildPasswordField(
                                  label: "New Password",
                                  controller: _newController,
                                  obscure: _obscureNew,
                                  onToggle: () => setState(() => _obscureNew = !_obscureNew),
                                  hintText: "Enter your new password",
                                  brightness: brightness,
                                ),

                                const SizedBox(height: 24),

                                // Confirm Password
                                _buildPasswordField(
                                  label: "Confirm Password",
                                  controller: _confirmController,
                                  obscure: _obscureConfirm,
                                  onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
                                  hintText: "Repeat your new password",
                                  brightness: brightness,
                                ),

                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Change Password Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: brightness == Brightness.light
                              ? AppColors.primaryLight
                              : AppColors.primaryDark,
                          foregroundColor: AppColors.whiteCommon,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          // Add password validation logic here
                          if (_newController.text == _confirmController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.successColor,
                                content: Text(
                                  'Password changed successfully!',
                                  style: AppTextStyles.body(brightness).copyWith(
                                    color: AppColors.whiteCommon,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: AppColors.errorColor,
                                content: Text(
                                  'New passwords do not match!',
                                  style: AppTextStyles.body(brightness).copyWith(
                                    color: AppColors.whiteCommon,
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Change Password',
                          style: AppTextStyles.button(brightness).copyWith(
                            color: AppColors.whiteCommon,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback onToggle,
    required String hintText,
    required Brightness brightness,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.label(brightness).copyWith(
            color: brightness == Brightness.light
                ? AppColors.fontLight
                : AppColors.fontDark,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscure,
          style: AppTextStyles.body(brightness).copyWith(
            color: brightness == Brightness.light
                ? AppColors.fontLight
                : AppColors.fontDark,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: brightness == Brightness.light
                ? AppColors.primaryContainerLight
                : AppColors.primaryContainerDark,
            hintText: hintText,
            hintStyle: AppTextStyles.body(brightness).copyWith(
              color: brightness == Brightness.light
                  ? AppColors.labelLight
                  : AppColors.labelDark,
            ),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: brightness == Brightness.light
                  ? AppColors.labelLight
                  : AppColors.labelDark,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscure ? Icons.visibility_off : Icons.visibility,
                color: brightness == Brightness.light
                    ? AppColors.labelLight
                    : AppColors.labelDark,
              ),
              onPressed: onToggle,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: brightness == Brightness.light
                    ? AppColors.primaryLight
                    : AppColors.primaryDark,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
