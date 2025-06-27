import 'package:flutter/material.dart';
import 'package:project_shakti/core/theme/app_colors.dart';
import 'package:project_shakti/core/widgets/button.dart';
import 'package:project_shakti/core/widgets/sign_in_button.dart';
import 'package:project_shakti/core/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emaiController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emaiController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emaiController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100),
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    child: Image.asset('assets/images/women2.webp'),
                  ),
                ),
                Text(
                  'Raksha',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                InputTextField(lable: 'Email', controller: emaiController),
                SizedBox(height: 25),
                InputTextField(
                  lable: 'Password',
                  controller: passwordController,
                ),
                SizedBox(height: 40),
                Button(
                  icons: null,
                  label: 'Login',
                  btncolor: AppColors.primary,
                  lablColor: AppColors.surface,
                ),
                SizedBox(height: 30),
                Text(
                  'or Connect',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                SizedBox(height: 30),
                SignInButton(
                  imagePath: 'assets/images/google.png',
                  labelText: 'Login with Google',
                ),
                SignInButton(
                  imagePath: 'assets/images/apple.png',
                  labelText: 'Login with Apple',
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Create Account ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
