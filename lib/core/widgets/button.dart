import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';

class Button extends StatelessWidget {
  final String label;
  final Color btncolor;
  final Color lablColor;
  final IconData? icons;
  const Button({
    super.key,
    required this.btncolor,
    required this.lablColor,
    required this.label,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialButton(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: 375,
              height: 55,
              decoration: BoxDecoration(
                color: btncolor,
                borderRadius: BorderRadius.circular(10),
                border: BoxBorder.all(
                  width: 3,
                  style: BorderStyle.solid,
                  color: AppColors.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Icon(icons, size: 40),
            ),
            Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: lablColor,
                ),
              ),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
