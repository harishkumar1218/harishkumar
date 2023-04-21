import 'package:admeme/af/about.dart';
import 'package:admeme/af/appupdates.dart';
import 'package:admeme/af/privacypolicy.dart';
import 'package:admeme/af/termsandconditions.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'infopage.dart';

class about extends StatelessWidget {
  const about({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text("About",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context);
            },
            icon: GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: Colors.black,
              ),
              title: Text(
                'Privacy Policy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: PrivacyPolicyPage(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.policy_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Terms & Conditions',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: TermsAndConditionsPage(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.update_rounded,
                color: Colors.black,
              ),
              title: Text(
                'App updates',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: FutureUpdatesPage(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
          ],
        ),
      ),
    );
  }
}
