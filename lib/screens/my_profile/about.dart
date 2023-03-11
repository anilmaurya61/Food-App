import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'About Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'We are a team of developers passionate about creating great software.',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Contact Us:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Email: contact@company.com'),
            Text('Phone: 123-456-7890'),
          ],
        ),
      ),
    );
  }
}
