import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  Flexible(
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: constraints.maxHeight - 80),
                        child: IntrinsicHeight(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Back + Title
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: const Color(0xFFF5F5F5),
                                    child: IconButton(
                                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'Change Password',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(flex: 2),
                                ],
                              ),

                              const SizedBox(height: 32),

                              /// Current Password
                              _buildPasswordField(
                                label: "Current Password",
                                controller: _currentController,
                                obscure: _obscureCurrent,
                                onToggle: () =>
                                    setState(() => _obscureCurrent = !_obscureCurrent),
                                hintText: "Enter your current password",
                              ),

                              const SizedBox(height: 8),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),

                              const SizedBox(height: 20),

                              /// OR Divider
                              const Row(
                                children: [
                                  Expanded(child: Divider(color: Colors.grey)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12),
                                    child: Text("OR", style: TextStyle(color: Colors.grey)),
                                  ),
                                  Expanded(child: Divider(color: Colors.grey)),
                                ],
                              ),

                              const SizedBox(height: 20),

                              /// New Password
                              _buildPasswordField(
                                label: "New Password",
                                controller: _newController,
                                obscure: _obscureNew,
                                onToggle: () =>
                                    setState(() => _obscureNew = !_obscureNew),
                                hintText: "Confirm your password",
                              ),

                              const SizedBox(height: 20),

                              ///Confirm Password
                              _buildPasswordField(
                                label: "Confirm Password",
                                controller: _confirmController,
                                obscure: _obscureConfirm,
                                onToggle: () =>
                                    setState(() => _obscureConfirm = !_obscureConfirm),
                                hintText: "Repeat your new password",
                              ),

                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withValues(alpha: 0.6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        print("Current: ${_currentController.text}");
                        print("New: ${_newController.text}");
                        print("Confirm: ${_confirmController.text}");
                      },
                      child: const Text(
                        "Change Password",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
