import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_shakti/features/add_friend/views/add_friend_screen.dart';
import 'package:project_shakti/features/edit_friend/views/edit_friend_screen.dart';

class FriendListPage extends StatelessWidget {
  const FriendListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = "Ummar Khan";
    final number = "6392606371";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Shakti',
          style: GoogleFonts.poppins(
            color: Colors.purple,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Friends",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Icon(Icons.groups, size: 60, color: Colors.grey),
            const SizedBox(height: 12),
            Text(
              "Friends are someone who will receive\nyour live location when you use\n",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 15),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.poppins(fontSize: 15, color: Colors.black),
                children: const [
                  TextSpan(text: 'Guard me '),
                  TextSpan(
                    text: '& SOS',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(text: ' feature.'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Friend Details",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage(
                      'assets/avatar.png',
                    ), // Use a placeholder or network image
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(number, style: GoogleFonts.poppins(fontSize: 14)),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // edit friend logic
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  EditFriendPage(name: name, number: number),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () {
                // Navigate to AddFriendPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddFriendPage(),
                  ),
                );
              },
              child: Column(
                children: [
                  const Icon(Icons.add_circle, size: 36, color: Colors.purple),
                  const SizedBox(height: 6),
                  Text(
                    "Add more friends",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
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
