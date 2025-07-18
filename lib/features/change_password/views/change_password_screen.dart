import 'package:flutter/material.dart';
import 'package:project_shakti/core/constants/app_icons.dart';
import 'package:project_shakti/core/utils/ui_helper.dart';
import 'package:project_shakti/core/widgets/custom_button.dart';
import 'package:project_shakti/core/widgets/custom_text_field.dart';

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
              Text(
                "Current Password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              CustomTextField(
                labelText: "Enter current password",
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
              Text(
                "New Password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              CustomTextField(
                labelText: "Enter new password",
                icon: AppIcons.lock,
                iconColor: Theme.of(context).colorScheme.tertiary,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20),
              Text(
                "Confirm Password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              CustomTextField(
                labelText: "Re-Enter password",
                icon: AppIcons.lock,
                iconColor: Theme.of(context).colorScheme.tertiary,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),

              /// Current Password
              // _buildPasswordField(
              //   label: "Current Password",
              //   controller: _currentController,
              //   obscure: _obscureCurrent,
              //   onToggle:
              //       () => setState(() => _obscureCurrent = !_obscureCurrent),
              //   hintText: "Enter your current password",
              // ),

              // const SizedBox(height: 8),

              // const SizedBox(height: 20),

              // /// New Password
              // _buildPasswordField(
              //   label: "New Password",
              //   controller: _newController,
              //   obscure: _obscureNew,
              //   onToggle: () => setState(() => _obscureNew = !_obscureNew),
              //   hintText: "Confirm your password",
              // ),

              // const SizedBox(height: 20),

              // ///Confirm Password
              // _buildPasswordField(
              //   label: "Confirm Password",
              //   controller: _confirmController,
              //   obscure: _obscureConfirm,
              //   onToggle:
              //       () => setState(() => _obscureConfirm = !_obscureConfirm),
              //   hintText: "Repeat your new password",
              // ),
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
  required String label,
  required TextEditingController controller,
  required bool obscure,
  required VoidCallback onToggle,
  String? hintText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      const SizedBox(height: 8),
      TextField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade100,
          hintText: hintText,
          prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[700]),
          suffixIcon: IconButton(
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[700],
            ),
            onPressed: onToggle,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ],
  );
}
