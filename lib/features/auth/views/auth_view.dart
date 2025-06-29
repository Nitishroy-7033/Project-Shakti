import 'package:flutter/material.dart';
import 'package:project_shakti/features/auth/widgets/login_form.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        LoginForm()
      ],),
    );
  }
}