import 'package:flutter/material.dart';
import 'package:project_shakti/features/sos_community_response/models/dummy_test_data.dart';
import 'package:project_shakti/features/sos_community_response/widgets/cardofsospage.dart';

class SOSHistoryPage extends StatelessWidget {
  const SOSHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dumdatainstance = dummySOSHistory;

    //
    final TextStyle textone = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      //appBar: AppBar(title: Text('SOS History')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 18),
                  Text('Community Support', style: textone),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                  SizedBox(width: 4),
                ],
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: dumdatainstance.length,
                itemBuilder: (context, index) {
                  final historyItem = dumdatainstance[index];
                  return Cardofsospage(
                    distance: historyItem.distance,
                    location: historyItem.location,
                    status: historyItem.status,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
