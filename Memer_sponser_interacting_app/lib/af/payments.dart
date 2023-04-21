import 'package:admeme/af/upipayments.dart';
import 'package:admeme/af/paymenthistory.dart';
import 'package:admeme/af/payments.dart';
import 'package:admeme/pages/notifi.dart';
import 'package:flutter/material.dart';
//import 'package:meme/pages/sendpaymentspage.dart';
import 'package:admeme/pages/profile.dart';
import 'package:admeme/af/qrcodepage.dart';
import 'package:page_transition/page_transition.dart';

import 'infopage.dart';

class payments extends StatelessWidget {
  const payments({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text("Payments",
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
                Icons.payment,
                color: Colors.black,
              ),
              title: Text(
                'Send Payments',
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
                        child: upiPayments(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.history,
                color: Colors.black,
              ),
              title: Text(
                'History',
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
                        child: NotificationPage(),
                        type: PageTransitionType.rightToLeft));
              },
            ),

            // @override
            // Widget build(BuildContext context) {
            //   return Scaffold(
            //     backgroundColor: Color.fromARGB(240, 246, 236, 249),
            //     appBar: AppBar(
            //       backgroundColor: Color.fromARGB(255, 190, 113, 238),
            //       title: Text("Payments",
            //           style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            //       leading: IconButton(
            //           onPressed: () {
            //             Navigator.of(context).pop();
            //           },
            //           icon: Icon(
            //             Icons.arrow_back,
            //             color: Colors.white,
            //           )),
            //     ),
            //     body: Container(
            //       // padding: const EdgeInsets.all(8),
            //       child: ListView(
            //         children: [
            //           // SizedBox(height: 18),
            //           Row(
            //             children: [
            //               Icon(
            //                 Icons.payment,
            //                 color: Color.fromARGB(227, 80, 49, 239),
            //               ),
            //               GestureDetector(
            //                 child: Text("Send Payments",
            //                     style: TextStyle(
            //                         fontSize: 22, color: Colors.black.withOpacity(0.8))),

            //                 // SizedBox(width: 13),
            //                 onTap: () {
            //                   Navigator.push(context,
            //                       MaterialPageRoute(builder: (context) => upiPayments()));
            //                 },
            //               ),
            //             ],
            //           ),
            //           Divider(height: 15, thickness: 1),
            // SizedBox(height: 8),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.qr_code_2,
            //       color: Color.fromARGB(226, 8, 2, 35),
            //     ),
            //     SizedBox(width: 13),
            //     GestureDetector(
            //       child: Text("My QR Code",
            //           style: TextStyle(
            //               fontSize: 22, color: Colors.black.withOpacity(0.8))),
            //       onTap: () {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => profile()));
            //       },
            //     )
            //   ],
            // ),
            // Divider(height: 15, thickness: 1),
            // SizedBox(height: 8),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.qr_code_scanner,
            //       color: Color.fromARGB(225, 239, 49, 122),
            //     ),
            //     SizedBox(width: 13),
            //     GestureDetector(onTap: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => scanQR(),
            //           ));
            //     }),
            //     Text("Scan QR Code",
            //         style: TextStyle(
            //             fontSize: 22, color: Colors.black.withOpacity(0.8)))
            //   ],
            // ),
            // Divider(height: 15, thickness: 1),
            // SizedBox(height: 8),
            // Row(
            //   children: [
            //     Icon(
            //       Icons.add_circle_outline_rounded,
            //       color: Color.fromARGB(225, 27, 106, 29),
            //     ),
            //     GestureDetector(),
            //     SizedBox(width: 13),
            //     Text("Add Payment method",
            //         style: TextStyle(
            //             fontSize: 22, color: Colors.black.withOpacity(0.8)))
            //   ],
            // ),
            // Divider(height: 15, thickness: 1),
            // SizedBox(height: 8),
            //         Row(
            //           children: [
            //             Icon(
            //               Icons.history,
            //               color: Color.fromARGB(226, 49, 172, 239),
            //             ),
            //             // SizedBox(width: 13),
            //             GestureDetector(
            //               child: Text("History",
            //                   style: TextStyle(
            //                       fontSize: 22, color: Colors.black.withOpacity(0.8))),
            //               onTap: () {
            //                 Navigator.push(context,
            //                     MaterialPageRoute(builder: (context) => historypage()));
            //               },
            //             )
            //           ],
            //         ),
            //         Divider(height: 15, thickness: 1),
          ],
        ),
      ),
    );
  }
}
