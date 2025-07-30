import 'package:flutter/material.dart';

class Cardofsospage extends StatelessWidget {
  final String status;
  final String distance;
  final String location;

  Cardofsospage({
    required this.status,
    required this.distance,
    required this.location,
    super.key,
  });

  final TextStyle textone = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  final TextStyle buttontext = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
  @override
  Widget build(BuildContext context) {
    final isOpen = status.toLowerCase() == 'open';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        // border: Border.all(),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('At : $location', style: textone),

            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                style: textone,
                children: [
                  const TextSpan(
                    text: 'Status : ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: status,
                    style: TextStyle(color: isOpen ? Colors.red : Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text('Distance : $distance', style: textone),

            const SizedBox(height: 18),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          Icons.handshake,
                          color: Colors.black,
                          size: 14,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '4+ Member Accepted',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {}, // TODO: Handle ignore logic
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 0.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(10),
                            ),
                          ),
                          foregroundColor: Colors.grey[700],
                          backgroundColor: Colors.grey[400],
                          side: BorderSide(color: Colors.grey[400]!),
                        ),
                        child: Text('Ignore', style: buttontext),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {}, // TODO: Handle accept logic
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.all(
                              Radius.circular(10),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 0.5,
                          ),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                        ),
                        child: Text('Accept', style: buttontext),
                      ),
                    ],
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
