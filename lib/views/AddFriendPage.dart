import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'friend_list_page.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({super.key});

  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  int _selectedIndex = 0;

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
                                _nameController.text =
                                    fullContact.displayName ?? '';
                                _numberController.text =
                                    fullContact.phones.first.number ?? '';
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

  Widget _buildBottomItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? Colors.purple : Colors.grey),
          if (isSelected)
            Text(
              label,
              style: GoogleFonts.poppins(
                color: Colors.purple,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.poppins(fontSize: 16, color: Colors.black);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Shakti',
          style: GoogleFonts.poppins(
            color: Colors.purple,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Add Friend',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Center(
                child: Icon(Icons.groups, size: 90, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              Text(
                "Add Friend's name",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                style: textStyle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter name',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Add Friend's number",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _numberController,
                      keyboardType: TextInputType.phone,
                      style: textStyle,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '+91 9876543210',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 58,
                    width: 52,
                    child: ElevatedButton(
                      onPressed: _pickContact,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.zero,
                        elevation: 0,
                      ),
                      child: const Icon(Icons.contacts, size: 24),
                    ),
                  ),
                ],
              ),
              // Rest of your existing body content remains unchanged
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.purple.shade100),
                  color: Colors.purple.shade50.withOpacity(0.3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.info_outline, color: Colors.purple),
                        const SizedBox(width: 8),
                        Text(
                          "Who are Friends?",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Friends are someone who will receive your live location when you use Guard me & SOS feature.',
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(
                          Icons.warning_amber_outlined,
                          color: Colors.purple,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "What is SOS button?",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'SOS button alerts your friends & local authorities during the time of an emergency.',
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FriendListPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 16,
                    ),
                  ),
                  child: Text(
                    'Add Friend',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 70,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomItem(Icons.shield, 'Guard Me', 0),
            _buildBottomItem(Icons.mic, 'Record', 1),
            const SizedBox(width: 40),
            _buildBottomItem(Icons.call, 'Fake Call', 2),
            _buildBottomItem(Icons.person, 'Profile', 3),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {},
        child: const Icon(Icons.notifications_active),
      ),
    );
  }
}
