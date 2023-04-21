import 'package:flutter/material.dart';

class PrivacySecurityHelpPage extends StatelessWidget {
  const PrivacySecurityHelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Privacy and Security Help'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Protecting Your Privacy and Security',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'In this App, we take the privacy and security of our users very seriously. Here are some tips and guidelines to help you protect your information:',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Choose a Strong Password',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8),
            Text(
              'Use a unique, complex password for your account that includes a mix of letters, numbers, and symbols. Avoid using common words or phrases, and don\'t reuse passwords across multiple accounts.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Enable Two-Factor Authentication',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8),
            Text(
              'Two-factor authentication adds an extra layer of security to your account by requiring a second factor, such as a code sent to your phone or email, in addition to your password.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Don\'t Share Your Password or Personal Information',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8),
            Text(
              'Never share your password or personal information, such as your full name, address, or credit card information, with anyone. Be wary of unsolicited emails or messages asking for this information.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Report Suspicious Activity',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8),
            Text(
              'If you notice any suspicious activity on your account, such as unauthorized logins or purchases, please contact us at freindsforever1234786@gmail.com.',
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions or concerns about privacy and security on our app, please feel free to reach out to us using the following contact information:',
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
              '- Address: sree vidyanikethan engineering college',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
