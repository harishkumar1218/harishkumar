import 'package:flutter/material.dart';

class FutureUpdatesPage extends StatelessWidget {
  const FutureUpdatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Future App Updates'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upcoming Features',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'We are constantly working to improve our app and add new features to enhance the user experience. Here are some of the upcoming features that you can expect to see in future updates:',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              '- Integration with social media platforms',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8),
            Text(
              '- Enhanced privacy settings',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8),
            Text(
              '- Improved user interface',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8),
            Text(
              '- Additional customization options',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            Text(
              'Release Schedule',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 8),
            Text(
              'We release app updates on a regular basis to fix bugs and add new features. Our goal is to provide the best possible user experience, and we appreciate your patience and support as we work to achieve that goal. Here is our anticipated release schedule for the next few updates:',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8),
            Text(
              '- Version 1.1:More Social media integration and enhanced privacy settings (Auguest 2023)',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 8),
            Text(
              '- Version 1.2: Additional customization options and user interface improvements (Dec 2023)',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
