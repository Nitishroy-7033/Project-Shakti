import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:project_shakti/core/constants/app_icons.dart';
import 'package:project_shakti/core/utils/ui_helper.dart';
import 'package:project_shakti/core/widgets/custom_button.dart';
import 'package:project_shakti/core/widgets/custom_text_field.dart';
import 'package:project_shakti/features/friend_list/views/friend_list_page.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({super.key});

  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  Future<void> _pickContact() async {
    try {
      // Request contact permission
      final permissionStatus = await Permission.contacts.request();
      if (permissionStatus.isGranted) {
        // Fetch all contacts
        final contacts = await FlutterContacts.getContacts();
        if (contacts.isNotEmpty) {
          // Show a dialog to pick a contact
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  title: const Text('Select a Contact'),
                  content: SizedBox(
                    width: double.maxFinite,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        final contact = contacts[index];
                        return ListTile(
                          title: Text(contact.displayName),
                          onTap: () async {
                            // Fetch detailed contact info
                            final fullContact =
                                await FlutterContacts.getContact(contact.id);
                            if (fullContact != null &&
                                fullContact.phones.isNotEmpty) {
                              setState(() {
                                _nameController.text = fullContact.displayName;
                                _numberController.text =
                                    fullContact.phones.first.number;
                              });
                              Navigator.pop(context);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('No contacts found')));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Contact permission denied')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error picking contact: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).colorScheme.primary),
        elevation: 0,
        title: Text(
          'Add Friend',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: UIHelper.paddingLarge,
          vertical: UIHelper.paddingMedium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                AppIcons.group,
                size: 80,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            UIHelper.getVerticalSpace(UIHelper.paddingMedium),
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
            SizedBox(height: 24),
            Text(
              "Friend's Number",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            UIHelper.getVerticalSpace(UIHelper.paddingSmall),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _numberController,
                    labelText: "Phone number",
                    icon: AppIcons.phone,
                    iconColor: Theme.of(context).colorScheme.tertiary,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: _pickContact,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.contacts,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            CustomButton(
              onPressed: () {
                context.push('/friendList');
              },
              text: "Add Friend",
            ),
            SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.5),
                ),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Who are Friends?",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Friends are someone who will receive your live location when you use Guard me & SOS feature.',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.warning_amber_outlined,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "What is SOS button?",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'SOS button alerts your friends & local authorities during the time of an emergency.',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
