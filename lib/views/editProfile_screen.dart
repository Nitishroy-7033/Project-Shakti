
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: "Yogendra");
  final TextEditingController _mobileController = TextEditingController(text: "+01 1234567890");
  String _selectedGender = 'male';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top section with avatar & background image
          Stack(
            children: [
              SizedBox(
                height: size.height * 0.3,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/bg.png',
                      fit: BoxFit.cover,
                    ),
                    Container(color: Colors.black.withOpacity(0.1)),
                  ],
                ),
              ),
              Positioned(
                top: size.height * 0.22,
                child: ClipPath(
                  clipper: BottomWaveClipper(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.8,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: paddingTop + 10,
                left: 16,
                child: const BackButton(color: Colors.white),
              ),
              Positioned(
                top: paddingTop + 20,
                left: 0,
                right: 0,
                child: const Center(
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.17,
                left: size.width / 2 - 50,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 46,
                        backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(Icons.edit, size: 14, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          const Text("Yogendra", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _buildLabeledField(label: "Name", controller: _nameController, hint: "Enter your name"),
                  const SizedBox(height: 20),
                  _buildLabeledField(label: "Phone Number", controller: _mobileController, hint: "Enter your mobile number"),
                  const SizedBox(height: 20),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Gender", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Male'),
                          value: 'male',
                          groupValue: _selectedGender,
                          onChanged: (val) {
                            setState(() => _selectedGender = val!);
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text('Female'),
                          value: 'female',
                          groupValue: _selectedGender,
                          onChanged: (val) {
                            setState(() => _selectedGender = val!);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  print("Name: \${_nameController.text}");
                  print("Mobile: \${_mobileController.text}");
                  print("Gender: \$_selectedGender");
                },
                child: const Text("S A V E", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String hint}) {
    return TextField(
      controller: controller,
      keyboardType: hint.toLowerCase().contains("mobile")
          ? TextInputType.phone
          : TextInputType.name,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black, width: 0.8),
        ),
      ),
    );
  }

  Widget _buildLabeledField({
    required String label,
    required TextEditingController controller,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildTextField(controller: controller, hint: hint),
      ],
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 40);
    path.quadraticBezierTo(size.width / 2, -40, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
