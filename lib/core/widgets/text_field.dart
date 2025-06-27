import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';

class InputTextField extends StatelessWidget {
  final String lable;
  final TextEditingController controller;
  const InputTextField({
    super.key,
    required this.lable,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: lable,
          labelStyle: TextStyle(color: AppColors.primary),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2, color: AppColors.textSecondary),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(width: 2),
          ),
        ),
      ),
    );
  }
}
