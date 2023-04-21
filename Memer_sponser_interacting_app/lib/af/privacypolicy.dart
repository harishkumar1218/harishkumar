import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Privacy Policy'),
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
              'Our app allows meme creators and sponsors to make deals to promote their businesses through Instagram. We take privacy seriously and are committed to protecting the personal information of our users.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'What information do we collect?',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'When users create an account on our app, we collect their username, email address, and password. When a meme creator and sponsor make a deal, we collect information about the sponsored post, including the sponsor’s name and the content of the post. We also collect data about how users interact with the app, including page views and clicks.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'How do we use this information?',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'We use the information we collect to provide our services, such as connecting meme creators and sponsors and tracking sponsored posts. We may also use the data to improve the app and to communicate with users about updates or changes to our policies.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Do we share this information?',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'We do not sell or rent personal information to third parties. Even we do not share data with service providers who help us with our operations, such as hosting the app or analyzing data. We may also disclose information when required by law or to protect our rights or property.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'How do we protect this information?',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'We take reasonable measures to protect user data, such as using secure servers and encryption. However, no method of transmission over the internet or electronic storage is 100% secure, so we cannot guarantee absolute security.',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
