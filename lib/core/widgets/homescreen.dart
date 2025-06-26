import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shakti'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Profile",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ProfileSection(),
            //
            SizedBox(height: 20),
            //
            Divider(height: 10, thickness: 1),
            //
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "More Options",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(child: MoreOptionsSection()),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Log out logic here
                },
                child: Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                'assets/avatar.png',
              ), // Replace with your image asset
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rashi Pathak',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '+91 6392606371',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Edit profile action
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MoreOptionsSection extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {'icon': Icons.people, 'label': 'Friends'},
    {'icon': Icons.help, 'label': 'Help Line'},
    {'icon': Icons.group, 'label': 'NGOs'},
    {'icon': Icons.gavel, 'label': 'Legal Aid'},
    {'icon': Icons.group, 'label': 'Peers'},
    {'icon': Icons.document_scanner, 'label': 'Document'},
    {'icon': Icons.language, 'label': 'Language'},
    {'icon': Icons.connect_without_contact, 'label': 'Connect'},
  ];

  MoreOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,

      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children:
          options.map((opt) {
            return Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 100,
                height: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // minimumSize: Size(60, 60),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.deepPurple,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    // Button action here
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(opt['icon'], size: 50),
                      SizedBox(height: 10),
                      Text(opt['label'], style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
