import 'package:flutter/material.dart';
import 'package:project_shakti/core/constants/app_icons.dart';
import 'package:project_shakti/core/utils/ui_helper.dart';
import 'package:project_shakti/core/widgets/custom_button.dart';
import 'package:project_shakti/core/widgets/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController(
    text: "Yogendra",
  );
  final TextEditingController _mobileController = TextEditingController(
    text: "+01 1234567890",
  );
  final TextEditingController _emailController = TextEditingController(
    text: "rupkirani@mail.com",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).colorScheme.primary),
        title: Text(
          "Edit Profile",
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
              Center(
                child: Text(
                  "Yogendra",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 20),
              Text("Name", style: Theme.of(context).textTheme.headlineMedium),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              CustomTextField(
                controller: _nameController,
                labelText: '',
                icon: AppIcons.profile,
                iconColor: Theme.of(context).colorScheme.primary,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20),
              Text("Email", style: Theme.of(context).textTheme.headlineMedium),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              CustomTextField(
                controller: _emailController,
                labelText: "",
                icon: Icons.email_outlined,
                iconColor: Theme.of(context).colorScheme.primary,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 20),
              Text("Phone", style: Theme.of(context).textTheme.headlineMedium),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              CustomTextField(
                controller: _mobileController,
                labelText: "",
                icon: AppIcons.phone,
                iconColor: Theme.of(context).colorScheme.primary,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 50),
              CustomButton(
                onPressed: () {
                  print("Current: ${_nameController.text}");
                  print("New: ${_emailController.text}");
                  print("Confirm: ${_mobileController.text}");
                },
                isEnabled: false,
                text: "SAVE",
              ),
            ],
          ),
        ),
      ),
    );
  }
}