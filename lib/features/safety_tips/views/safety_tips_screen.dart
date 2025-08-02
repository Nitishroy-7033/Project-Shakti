import 'package:flutter/material.dart';

class SafetyTipsScreen extends StatelessWidget {
  const SafetyTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Safety Tips')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tip of the Day Section
            const Text(
              'Tip of the Day',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Avoid dark alleys when walking alone at night',
              style: TextStyle(fontSize: 16),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Add tip refresh logic here if needed
                },
                child: const Text(
                  'REFRESH TIP',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Divider(thickness: 1),

            // Browse Tips by Category
            const Text(
              'Browse Tips by Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            _buildCheckboxRow('Travel Safety', false),
            _buildCheckboxRow('Home Alone Tips', true),
            _buildCheckboxRow('Using Panic Features', false),
            const Divider(thickness: 1),

            // Personalized Suggestions
            const Text(
              'Personalized Suggestions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            _buildBulletPoint('Based on your travel history:'),
            _buildBulletPoint('Avoid long stops at isolated locations.'),
            _buildBulletPoint('Share trip before starting'),
            const Divider(thickness: 1),

            // How to Use This App
            const Text(
              'How to Use This App',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            _buildInstructionItem('Using Panic Mode', false),
            _buildInstructionItem('Shake phone or press power button Sx', true),
            _buildInstructionItem('Sends silent SOS with recording', true),
            const Divider(thickness: 1),

            // Triggering SOS Alert
            const Text(
              'Triggering SOS Alert',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            _buildInstructionItem(
              'Tap SOS button from Live Trip screen',
              false,
            ),
            _buildInstructionItem('Shares live location & starts camera', true),
            const Divider(thickness: 1),

            // Live Trip Monitoring
            const Text(
              'Live Trip Monitoring',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            _buildInstructionItem('Start trip to track your route', false),
            _buildInstructionItem(
              'App checks for deviation and alerts you',
              true,
            ),
            const SizedBox(height: 20),

            // Bottom Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Add GOT IT logic if needed
                  },
                  child: const Text(
                    'GOT IT!',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add NEXT logic if needed
                  },
                  child: const Text(
                    'NEXT',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Extra padding at bottom
          ],
        ),
      ),
    );
  }

  static Widget _buildCheckboxRow(String label, bool isChecked) {
    return Row(
      children: [
        IgnorePointer(
          child: Checkbox(
            value: isChecked,
            onChanged: (_) {},
            activeColor: Colors.blue,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  static Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 16)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  static Widget _buildInstructionItem(String text, bool isSubItem) {
    return Padding(
      padding: EdgeInsets.only(left: isSubItem ? 48.0 : 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IgnorePointer(
            child: Checkbox(
              value: false,
              onChanged: (_) {},
              activeColor: Colors.blue,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
