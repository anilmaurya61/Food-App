import 'package:flutter/material.dart';

class ReferPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refer a Friend'),
        backgroundColor: Colors.amber,
        elevation: 0, // Remove app bar shadow
      ),
      backgroundColor: Colors.amber[100], // Set background color to lighter shade of yellow
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Invite your friends to join our grocery app and earn rewards!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.amber[800],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // Add box shadow
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Your referral code:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber[800],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.amber[50],
                          ),
                          child: Text(
                            'REF1234',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber[800],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Implement share functionality to share referral code
                        },
                        child: Text(
                          'Share',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber[800],
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Rewards:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.amber[800],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'When your friend signs up using your referral code, both of you will earn 100 reward points each!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
