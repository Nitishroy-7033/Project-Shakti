import 'package:flutter/material.dart';
import 'package:project_shakti/core/widgets/button.dart';
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
                    color: Colors.deepPurple,
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
                  btncolor: Colors.deepPurple,
                  lablColor: Colors.white,
                ),
                SizedBox(height: 30),
                Text(
                  'or Connect',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                SizedBox(height: 30),
                Button(
                  icons: Icons.g_mobiledata,
                  label: 'Login with Google',
                  btncolor: Colors.white,
                  lablColor: Colors.black,
                ),
                SizedBox(height: 20),
                Button(
                  icons: Icons.apple,
                  label: 'Login with Apple',
                  btncolor: Colors.white,
                  lablColor: Colors.black,
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Create Account ?'),
                    TextButton(onPressed: () {}, child: Text('Sign Up')),
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
