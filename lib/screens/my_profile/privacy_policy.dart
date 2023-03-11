import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            Text(
              'We take your privacy very seriously. This privacy policy explains what personal information we collect and how we use it.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Information we collect',
              style: TextStyle(color: Color.fromARGB(255, 11, 9, 9), fontSize: 14.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'We collect information about you when you use our app. This includes:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              '- Your name\n'
              '- Your email address\n'
              '- Your phone number\n'
              '- Your location',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'How we use your information',
              style: TextStyle(color: Color.fromARGB(255, 11, 9, 9), fontSize: 14.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'We use your information to:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              '- Provide you with our grocery delivery service\n'
              '- Improve our app and services\n'
              '- Contact you about promotions and special offers\n'
              '- Analyze app usage to better understand our users',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Sharing your information',
              style: TextStyle(color: Color.fromARGB(255, 11, 9, 9), fontSize: 14.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'We do not share your information with third parties without your consent.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Security',
              style: TextStyle(color: Color.fromARGB(255, 11, 9, 9), fontSize: 14.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'We take the security of your personal information very seriously and use appropriate measures to protect it.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Changes to this policy',
              style: TextStyle(color: Color.fromARGB(255, 11, 9, 9), fontSize: 14.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on our website.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
