import 'package:flutter/material.dart';
import 'package:project_shakti/core/constants/app_icons.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/utils/ui_helper.dart';
import 'package:project_shakti/core/widgets/custom_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).colorScheme.primary),
        elevation: 0,
        title: Text(
          'Change Password',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UIHelper.paddingLarge,
            vertical: UIHelper.paddingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Current Password
              Text(
                "Current Password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              _buildPasswordField(
                context: context,
                brightness: brightness,
                controller: _currentController,
                obscure: _obscureCurrent,
                onToggle:
                    () => setState(() => _obscureCurrent = !_obscureCurrent),
                hintText: "Enter your current password",
                icon: AppIcons.lock,
                iconColor: Theme.of(context).colorScheme.tertiary,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              SizedBox(height: 10),

              /// New Password
              Text(
                "New Password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              _buildPasswordField(
                context: context,
                brightness: brightness,
                controller: _newController,
                obscure: _obscureNew,
                onToggle: () => setState(() => _obscureNew = !_obscureNew),
                hintText: "Enter your new password",
                icon: AppIcons.lock,
                iconColor: Theme.of(context).colorScheme.tertiary,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20),

              ///Confirm Password
              Text(
                "Confirm Password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              _buildPasswordField(
                context: context,
                brightness: brightness,
                controller: _confirmController,
                obscure: _obscureConfirm,
                onToggle:
                    () => setState(() => _obscureConfirm = !_obscureConfirm),
                hintText: "Repeat your new password",
                icon: AppIcons.lock,
                iconColor: Theme.of(context).colorScheme.tertiary,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  print("Current: ${_currentController.text}");
                  print("New: ${_newController.text}");
                  print("Confirm: ${_confirmController.text}");
                },
                text: "Change Password",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPasswordField({
  required BuildContext context,
  required Brightness brightness,
  required TextEditingController controller,
  required bool obscure,
  required VoidCallback onToggle,
  String? hintText,
  String? Function(String?)? validator,
  TextInputType? keyboardType,
  IconData? icon,
  Color? iconColor,
  TextInputAction? textInputAction,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscure,
    keyboardType: keyboardType,
    validator: validator,
    textInputAction: textInputAction,
    style: Theme.of(
      context,
    ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
    decoration: InputDecoration(
      labelStyle: Theme.of(context).textTheme.labelMedium,
      floatingLabelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ),
      filled: true,
      fillColor: Theme.of(context).colorScheme.primaryContainer,
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.labelMedium,
      prefixIcon: Icon(
        icon,
        color: iconColor ?? Theme.of(context).colorScheme.primary,
        size: 20,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          obscure ? Icons.visibility_off : Icons.visibility,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        onPressed: onToggle,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color:
              brightness == Brightness.dark
                  ? AppColors.whiteCommon.withValues(alpha: 0.2)
                  : AppColors.blackCommon.withValues(alpha: 0.1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
      constraints: BoxConstraints(maxHeight: 50),
      contentPadding: EdgeInsets.all(0),
    ),
  );
}
