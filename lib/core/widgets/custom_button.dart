import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final ButtonStyle? style;
  final Color? backgroundColor;
  final MaterialColor? textColor;
  final Color? borderColor;

  const CustomButton({
    super.key,
    this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.style,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return ElevatedButton(
      onPressed: isLoading || !isEnabled ? null : onPressed,
      style:
          style ??
          ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColor.accentPink(brightness),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side:
                  borderColor != null
                      ? BorderSide(color: borderColor!)
                      : BorderSide.none,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            elevation: isEnabled ? 2 : 0,
          ),
      child:
          isLoading
              ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Colors.white),
              )
              : Text(
                text ?? '',
                style: AppTextStyles.button(brightness).copyWith(
                  color: textColor ?? AppTextStyles.button(brightness).color,
                ),
              ),
    );
  }
}
