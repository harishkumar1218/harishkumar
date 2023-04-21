import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Help Center'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'Here are some answers to common questions that users have about our app:',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Q: How do I create an account?',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8),
            Text(
              'A: To create an account, simply tap the "Sign Up" button on the home screen and follow the prompts to enter your information and create a username and password.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Q: How do I reset my password?',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8),
            Text(
              'A: If you need to reset your password, simply tap the "Forgot Password" button on the login screen and follow the prompts to reset your password.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Q: How do I report a bug or issue with the app?',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8),
            Text(
              'A: If you encounter a bug or issue with the app, please email us at freindsforever1234786@gmail.com with a detailed description of the problem and any relevant screenshots or error messages. Our team will work to resolve the issue as quickly as possible.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'If you have any other questions or concerns, please feel free to reach out to us using the following contact information:',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8),
            Text(
              '- Email: freindsforever1234786@gmail.com',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8),
            Text(
              '- Phone: 8330944531',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8),
            Text(
              '- Address: Sree Vidyanikethan Engineering College',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
