import 'package:flutter/material.dart';

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
          labelStyle: TextStyle(color: Colors.deepPurple),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.deepPurple),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
