import 'package:flutter/material.dart';
import 'package:project_shakti/core/constants/app_icons.dart';
import 'package:project_shakti/core/utils/ui_helper.dart';
import 'package:project_shakti/core/widgets/custom_button.dart';
import 'package:project_shakti/core/widgets/custom_text_field.dart';

class EditFriendPage extends StatefulWidget {
  final String? name;
  final String? number;

  const EditFriendPage({super.key, this.name, this.number});

  @override
  State<EditFriendPage> createState() => _EditFriendPageState();
}

class _EditFriendPageState extends State<EditFriendPage> {
  late TextEditingController _nameController;
  late TextEditingController _numberController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _numberController = TextEditingController(text: widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).colorScheme.primary),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Edit Friend",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UIHelper.paddingLarge,
            vertical: UIHelper.paddingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Friend's Name",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              CustomTextField(
                controller: _nameController,
                labelText: "Enter name",
                icon: AppIcons.profile,
                iconColor: Theme.of(context).colorScheme.tertiary,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 30),
              Text(
                "Friend's Number",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              CustomTextField(
                controller: _numberController,
                labelText: "Phone number",
                icon: AppIcons.phone,
                iconColor: Theme.of(context).colorScheme.tertiary,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(height: 40),
              CustomButton(text: "Save", isLoading: false, onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
