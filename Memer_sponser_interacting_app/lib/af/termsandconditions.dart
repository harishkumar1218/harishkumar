import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Introduction',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'These Terms and Conditions govern the use of our app. By accessing or using the app, you agree to be bound by these terms. If you do not agree to these terms, please do not use the app.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Eligibility',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'You must be at least 13 years old to use our app. If you are under 18 years old, you must have permission from a parent or legal guardian to use the app.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Intellectual Property',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'All content on the app, including text, images, videos, and logos, is the property of our company or our licensors and is protected by intellectual property laws. You may not use or reproduce any content from the app without our permission.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Prohibited Activities',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'You may not use the app for any illegal or unauthorized purpose, including but not limited to spamming, phishing, or hacking. You may not use the app to harass, defame, or threaten other users or to post content that is obscene or offensive. You may not use the app to promote or engage in any commercial activity without our prior written consent.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Limitation of Liability',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'We are not liable for any damages or losses arising from the use of our app, including but not limited to direct, indirect, incidental, or consequential damages. We do not guarantee the accuracy or completeness of any information on the app, and we are not responsible for any errors or omissions in the content.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
