import 'package:flutter/material.dart';
import 'package:project_shakti/core/constants/app_icons.dart';
import 'package:project_shakti/core/constants/app_strings.dart';
import 'package:project_shakti/core/utils/ui_helper.dart';
import 'package:project_shakti/features/add_friend/views/add_friend_screen.dart';

class FriendListPage extends StatelessWidget {
  const FriendListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = "Ummar Khan";
    final number = "6392606371";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Theme.of(context).colorScheme.onPrimary),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          AppStrings.appNameLower,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddFriendPage()),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        child: Icon(AppIcons.addPerson),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: UIHelper.paddingLarge,
            vertical: UIHelper.paddingMedium,
          ),
          child: Column(
            children: [
              Text("Friends", style: Theme.of(context).textTheme.headlineLarge),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              Icon(
                AppIcons.group,
                size: 60,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              UIHelper.getVerticalSpace(UIHelper.paddingSmall),
              Text(
                "Friends are someone who will receive\nyour live location when you use",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(text: 'Guard me '),
                    TextSpan(
                      text: '& SOS',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    TextSpan(text: ' feature.'),
                  ],
                ),
              ),
              UIHelper.getVerticalSpace(UIHelper.paddingLarge),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Friend Details",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              UIHelper.getVerticalSpace(UIHelper.paddingMedium),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                elevation: 0,
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.network(
                      width: 40,
                      "https://storage.pixteller.com/designs/designs-images/2019-01-10/07/profile-phote-avatar-human-girl-yellow-fashion-1-5c3784f592e84.png",
                    ),
                  ),
                  title: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    number,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Icon(
                      AppIcons.edit,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  tileColor: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                elevation: 0,
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.network(
                      width: 40,
                      "https://storage.pixteller.com/designs/designs-images/2019-01-10/07/profile-phote-avatar-human-girl-yellow-fashion-1-5c3784f592e84.png",
                    ),
                  ),
                  title: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    number,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Icon(
                      AppIcons.edit,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  tileColor: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                elevation: 0,
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.network(
                      width: 40,
                      "https://storage.pixteller.com/designs/designs-images/2019-01-10/07/profile-phote-avatar-human-girl-yellow-fashion-1-5c3784f592e84.png",
                    ),
                  ),
                  title: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    number,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Icon(
                      AppIcons.edit,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  tileColor: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                elevation: 0,
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.network(
                      width: 40,
                      "https://storage.pixteller.com/designs/designs-images/2019-01-10/07/profile-phote-avatar-human-girl-yellow-fashion-1-5c3784f592e84.png",
                    ),
                  ),
                  title: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    number,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Icon(
                      AppIcons.edit,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  tileColor: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                elevation: 0,
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.network(
                      width: 40,
                      "https://storage.pixteller.com/designs/designs-images/2019-01-10/07/profile-phote-avatar-human-girl-yellow-fashion-1-5c3784f592e84.png",
                    ),
                  ),
                  title: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    number,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Icon(
                      AppIcons.edit,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  tileColor: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                elevation: 0,
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.network(
                      width: 40,
                      "https://storage.pixteller.com/designs/designs-images/2019-01-10/07/profile-phote-avatar-human-girl-yellow-fashion-1-5c3784f592e84.png",
                    ),
                  ),
                  title: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  subtitle: Text(
                    number,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: InkWell(
                    onTap: () {},
                    child: Icon(
                      AppIcons.edit,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  tileColor: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
