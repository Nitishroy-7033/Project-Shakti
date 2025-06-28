import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmallDevice = constraints.maxHeight < 600;

            return SingleChildScrollView(
              child: Column(
                children: [
                  // Top Profile Section with Background Image
                  Container(
                    height: isSmallDevice ? 180 : 220,
                    width: double.infinity,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Background Image
                        Image.asset(
                          'assets/images/bg.png',
                          fit: BoxFit.cover,
                        ),

                        // Overlay
                        Container(
                          color: Colors.black.withValues(alpha: 0.3),
                        ),

                        //Foreground Profile Content
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, paddingTop + 20, 16, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'My Profile',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 40),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                    AssetImage('assets/images/profile.png'),
                                  ),
                                  const SizedBox(width: 16),
                                  const Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Yogendra',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '+01 1234567890',
                                          style: TextStyle(
                                              color: Colors.white70, fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {

                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.white.withValues(alpha: 0.15),
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: const BorderSide(
                                            color: Colors.white70, width: 0.5),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                    ),
                                    child: const Text(
                                      'Edit Profile',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  _buildSection("Settings", [
                    _buildProfileOption(Icons.lock_outline, 'Change Password'),
                    _buildProfileOption(Icons.language, 'Language'),
                    _buildProfileOption(Icons.notifications_none, 'Notification'),
                  ]),

                  _buildSection("About Us", [
                    _buildProfileOption(Icons.help_outline, 'FAQ'),
                    _buildProfileOption(
                        Icons.privacy_tip_outlined, 'Privacy Policy'),
                    _buildProfileOption(Icons.mail_outline, 'Contact Us'),
                  ]),

                  _buildSection("Other", [
                    _buildProfileOption(Icons.share, 'Share'),
                    _buildProfileOption(Icons.system_update_alt,
                        'Get The Latest Version'),
                  ]),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> options) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...options,
        ],
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200, width: 0.8),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.grey.shade600, size: 24),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
