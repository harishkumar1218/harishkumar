import 'package:admeme/af/help.dart';
import 'package:admeme/af/helpcenter.dart';
import 'package:admeme/af/privacyandsqityhelp.dart';
import 'package:flutter/material.dart';
import 'package:admeme/af/report.dart';
import 'package:page_transition/page_transition.dart';

import 'accounts.dart';

class help extends StatelessWidget {
  const help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 1, 14),
        title: Text("Help",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.report_problem,
                color: Colors.black,
              ),
              title: Text(
                'report a problem',
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
                        child: reportpage(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.help_center,
                color: Colors.black,
              ),
              title: Text(
                'Help Centre',
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
                        child: HelpCenterPage(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.scatter_plot_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Privacy and Security help',
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
                        child: PrivacySecurityHelpPage(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.support,
            //     color: Colors.black,
            //   ),
            //   title: Text(
            //     'Support Requests',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios,
            //     color: Colors.black,
            //   ),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => accounts()));
            //   },
            //),
            // ListView(
            //   children: [
            //     SizedBox(height: 18),
            //     Row(
            //       children: [
            //         SizedBox(width: 13),
            //         GestureDetector(
            //           child: Text("Report Problem",
            //               style: TextStyle(
            //                   fontSize: 22, color: Colors.black.withOpacity(0.8))),
            //           onTap: () {
            //             Navigator.push(context,
            //                 MaterialPageRoute(builder: (context) => reportpage()));
            //           },
            //         )
            //       ],
            //     ),
            //     // Divider(height: 15, thickness: 1),
            //     SizedBox(height: 13),
            //     Row(
            //       children: [
            //         SizedBox(width: 13),
            //         Text("Help Centre",
            //             style: TextStyle(
            //                 fontSize: 22, color: Colors.black.withOpacity(0.8)))
            //       ],
            //     ),
            //     SizedBox(height: 13),
            //     Row(
            //       children: [
            //         SizedBox(width: 13),
            //         Text("Privacy and Security help",
            //             style: TextStyle(
            //                 fontSize: 22, color: Colors.black.withOpacity(0.8)))
            //       ],
            //     ),
            //     SizedBox(height: 13),
            //     Row(
            //       children: [
            //         SizedBox(width: 13),
            //         Text("Support Requests",
            //             style: TextStyle(
            //                 fontSize: 22, color: Colors.black.withOpacity(0.8)))
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
