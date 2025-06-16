import 'package:flutter/material.dart';
import 'package:project_shakti/core/widgets/button.dart';
import 'package:project_shakti/core/widgets/text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController nameController;
  late TextEditingController emaiController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emaiController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emaiController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(height: 60),
              Center(
                child: InputTextField(
                  lable: "Full name",
                  controller: nameController,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: InputTextField(
                  lable: "Your email adress",
                  controller: nameController,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: InputTextField(
                  lable: "Password",
                  controller: nameController,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: InputTextField(
                  lable: "Confirm password",
                  controller: nameController,
                ),
              ),
              SizedBox(height: 50),

              Button(
                btncolor: Colors.deepPurple,
                lablColor: Colors.white,
                label: 'Sign Up',
                icons: null,
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Bact to'),
                  TextButton(onPressed: () {}, child: Text('Login')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
