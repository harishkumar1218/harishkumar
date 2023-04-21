import 'package:admeme/af/language.dart';
import 'package:admeme/af/searchhistory.dart';
import 'package:admeme/af/settings.dart';
import 'package:admeme/pages/memerpofilesamp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

import 'infopage.dart';

class accounts extends StatelessWidget {
  const accounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text("Accounts",
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
                Icons.info_sharp,
                color: Colors.black,
              ),
              title: Text(
                'Account info',
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
                        child: personalinfopage(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.black,
              ),
              title: Text(
                'search history',
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
                        child: SearchHistoryPage(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.language,
                color: Colors.black,
              ),
              title: Text(
                'language',
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
                        child: LanguageSettingsPage(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.contact_page,
                color: Colors.black,
              ),
              title: Text(
                'contact synching',
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
                        child: personalinfopage(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            // ListTile(
            //   leading: Icon(
            //     Icons.account_circle,
            //     color: Colors.black,
            //   ),
            //   title: Text(
            //     'search history',
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //   ),
            //   trailing: Icon(
            //     Icons.arrow_forward_ios,
            //     color: Colors.black,
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => personalinfopage()));
            //   },
            // ),
            // ListView(
            //   children: [
            //     SizedBox(height: 18),
            //     GestureDetector(
            //       child: Row(
            //         children: [
            //           Icon(
            //             Icons.info_outlined,
            //             color: Color.fromARGB(255, 243, 33, 180),
            //           ),
            //           SizedBox(width: 7),
            //           Text("Personal info",
            //               style: TextStyle(
            //                   fontSize: 22, color: Colors.black.withOpacity(0.8))),
            //           Padding(
            //             padding: const EdgeInsets.only(left: 180),
            //             child: Icon(
            //               Icons.arrow_forward_ios,
            //               color: Colors.grey[600],
            //             ),
            //           ),
            //         ],
            //       ),
            //       onTap: (() {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: ((context) => personalinfopage())));
            //       }),
            //     ),
            //     Divider(height: 20, thickness: 2),
            //     Row(
            //       children: [
            //         Icon(
            //           Icons.search_sharp,
            //           color: Color.fromARGB(255, 85, 163, 242),
            //         ),
            //         SizedBox(width: 10),
            //         Text("Search History",
            //             style: TextStyle(
            //                 fontSize: 22, color: Colors.black.withOpacity(0.8))),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 150),
            //           child: Icon(
            //             Icons.arrow_forward_ios,
            //             color: Colors.grey[600],
            //           ),
            //         ),
            //       ],
            //     ),
            //     Divider(height: 20, thickness: 2),
            //     // Row(
            //     //   children: [
            //     //     Icon(
            //     //       Icons.language,
            //     //       color: Color.fromARGB(255, 44, 26, 238),
            //     //     ),
            //     //     SizedBox(width: 10),
            //     //     Text("Language",
            //     //         style: TextStyle(
            //     //             fontSize: 22, color: Colors.black.withOpacity(0.8))),
            //     //     Padding(
            //     //       padding: const EdgeInsets.only(left: 228),
            //     //       child: Icon(
            //     //         Icons.arrow_forward_ios,
            //     //         color: Colors.grey[600],
            //     //       ),
            //     //     ),
            //     //   ],
            //     // ),
            //     // Divider(height: 20, thickness: 2),
            //     Row(
            //       children: [
            //         Icon(
            //           Icons.contacts,
            //           color: Color.fromARGB(255, 85, 242, 153),
            //         ),
            //         SizedBox(width: 10),
            //         Text("Contact syncing",
            //             style: TextStyle(
            //                 fontSize: 22, color: Colors.black.withOpacity(0.8))),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 120),
            //           child: Icon(
            //             Icons.arrow_forward_ios,
            //             color: Colors.grey[600],
            //           ),
            //         ),
            //       ],
            //     ),
            //     Divider(height: 20, thickness: 2),
            //     Row(
            //       children: [
            //         Icon(
            //           Icons.domain_verification,
            //           color: Color.fromARGB(255, 212, 16, 75),
            //         ),
            //         SizedBox(width: 10),
            //         Text("Request verification",
            //             style: TextStyle(
            //                 fontSize: 22, color: Colors.black.withOpacity(0.8))),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 120),
            //           child: Icon(
            //             Icons.arrow_forward_ios,
            //             color: Colors.grey[600],
            //           ),
            //         ),
            //       ],
            //     ),
            //     Divider(height: 20, thickness: 2),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
