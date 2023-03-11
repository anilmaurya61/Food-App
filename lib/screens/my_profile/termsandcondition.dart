import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'Introduction',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'These terms and conditions govern your use of the Grocery App. By using the app, you accept these terms and conditions in full. If you disagree with these terms and conditions or any part of these terms and conditions, you must not use the app.',
              ),
              SizedBox(height: 20.0),
              Text(
                'User Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'In order to use the app, you must register for an account. You are responsible for maintaining the confidentiality of your account and password and for restricting access to your computer or mobile device. You agree to accept responsibility for all activities that occur under your account or password. You must notify us immediately if you suspect any unauthorized use of your account or access to your password.',
              ),
              SizedBox(height: 20.0),
              Text(
                'Disclaimer of Liability',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'The app and all information and materials contained in it are provided on an "as is" and "as available" basis. We make no warranty or representation, express or implied, as to the accuracy, completeness or reliability of the information or materials contained in the app. You use the app at your own risk and we will not be liable for any loss or damage arising from your use of the app.',
              ),
              SizedBox(height: 20.0),
              Text(
                'Governing Law',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'These terms and conditions shall be governed by and construed in accordance with the laws of the state in which the company is based, without giving effect to any principles of conflicts of law. You agree to submit to the exclusive jurisdiction of the courts located in that state.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
