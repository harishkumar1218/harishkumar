import 'package:admeme/af/Ads.dart';
import 'package:admeme/af/about.dart';
import 'package:admeme/af/accounts.dart';
import 'package:admeme/af/help.dart';
import 'package:admeme/af/notifications.dart';
import 'package:admeme/af/payments.dart';
import 'package:admeme/af/privacy.dart';
import 'package:admeme/af/security.dart';
import 'package:admeme/af/theme.dart';
import 'package:admeme/main.dart';
import 'package:admeme/main_page.dart';
import 'package:admeme/memer_customer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
//import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class settings extends StatelessWidget {
  bool _isnotify = true;
  bool isdark = false;
  static const keyDarkMode = 'key-dark-mode';

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to Logout ?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () => {
                    FirebaseAuth.instance.signOut(),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Memer_Customer(),
                        )),
                  },
                  child: Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text("Settings", style: TextStyle(fontSize: 23)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Account',
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
                        child: accounts(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: Colors.black,
              ),
              title: Text(
                'Privacy & Security',
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
                        child: privacy(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.payments_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Ads & Payments',
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
                        child: payments(),
                        type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info_outline_rounded,
                color: Colors.black,
              ),
              title: Text(
                'About',
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
                        child: about(), type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.help,
                color: Colors.black,
              ),
              title: Text(
                'Help',
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
                        child: help(), type: PageTransitionType.rightToLeft));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              title: Text(
                'Notification',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Switch(
                activeColor: Color.fromARGB(255, 0, 0, 0),
                value: _isnotify,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.dark_mode,
                color: Colors.black,
              ),
              title: Text(
                'Dark',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Switch(
                  activeColor: Colors.white,
                  value: isdark,
                  onChanged: ((value) {})),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                _onWillPop();
              },
            ),
          ],
        ),
        // child: ListView(
        //   children: [
        //     SizedBox(height: 18),
        //     SingleChildScrollView(
        //       child: Row(
        //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [

        //           Icon(
        //             Icons.account_circle,
        //             color: Colors.blue,
        //           ),
        //           SizedBox(width: 7),
        //           Text("Accounts",
        //               style:
        //                   TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        //           Padding(
        //             padding: EdgeInsets.only(
        //                 left: MediaQuery.of(context).size.width),
        //             child: GestureDetector(
        //               child: Icon(
        //                 Icons.arrow_forward_ios,
        //                 color: Colors.grey[600],
        //               ),
        //               onTap: () {
        //                 Navigator.push(
        //                     context,
        //                     MaterialPageRoute(
        //                         builder: (context) => accounts()));
        //               },
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //     Divider(height: 20, thickness: 2),
        //     Row(
        //       children: [
        //         Icon(
        //           Icons.notifications,
        //           color: Color.fromARGB(255, 243, 173, 33),
        //         ),
        //         SizedBox(width: 10),
        //         Text("Notifications",
        //             style:
        //                 TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        //         // Padding(
        //         //   padding: const EdgeInsets.only(left: 160),
        //         //   child: GestureDetector(
        //         //     child: Icon(
        //         //       Icons.arrow_forward_ios,
        //         //       color: Colors.grey[600],
        //         //     ),
        //         //     onTap: () {
        //         //       Navigator.push(
        //         //           context,
        //         //           MaterialPageRoute(
        //         //               builder: (context) => notifications()));
        //         //     },
        //         //   ),
        //         // ),
        //         Padding(
        //           padding: EdgeInsets.only(
        //               left: MediaQuery.of(context).size.width - 260),
        //           child: CupertinoSwitch(
        //             value: _switch,
        //             onChanged: (bool val) {
        //               // setState(() {
        //               //   _switch = val;
        //               // });
        //             },
        //           ),
        //         )
        //       ],
        //     ),
        //     Divider(height: 20, thickness: 2),
        //     Row(
        //       children: [
        //         Icon(
        //           Icons.privacy_tip,
        //           color: Color.fromARGB(255, 86, 29, 241),
        //         ),
        //         SizedBox(width: 10),
        //         Text("Privacy",
        //             style:
        //                 TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 215),
        //           child: GestureDetector(
        //             child: Icon(
        //               Icons.arrow_forward_ios,
        //               color: Colors.grey[600],
        //             ),
        //             onTap: () {
        //               Navigator.push(context,
        //                   MaterialPageRoute(builder: (context) => privacy()));
        //             },
        //           ),
        //         ),
        //       ],
        //     ),
        //     Divider(height: 20, thickness: 2),
        //     Row(
        //       children: [
        //         Icon(
        //           Icons.security,
        //           color: Color.fromARGB(255, 155, 237, 101),
        //         ),
        //         SizedBox(width: 10),
        //         Text("Security",
        //             style:
        //                 TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 210),
        //           child: GestureDetector(
        //             child: Icon(
        //               Icons.arrow_forward_ios,
        //               color: Colors.grey[600],
        //             ),
        //             onTap: () {
        //               Navigator.push(context,
        //                   MaterialPageRoute(builder: (context) => security()));
        //             },
        //           ),
        //         ),
        //       ],
        //     ),
        //     Divider(height: 20, thickness: 2),
        //     Row(
        //       children: [
        //         // GestureDetector(
        //         //   onTap: () {
        //         //     Navigator.push(context,MaterialPageRoute(builder: (context)=>payments() ));
        //         //   },
        //         // )
        //         Icon(
        //           Icons.paypal,
        //           color: Color.fromARGB(255, 155, 237, 101),
        //         ),
        //         SizedBox(width: 10),
        //         Text("Payments",
        //             style:
        //                 TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 195),
        //           child: GestureDetector(
        //             child: Icon(
        //               Icons.arrow_forward_ios,
        //               color: Colors.grey[600],
        //             ),
        //             onTap: () {
        //               Navigator.push(context,
        //                   MaterialPageRoute(builder: (context) => payments()));
        //             },
        //           ),
        //         ),
        //       ],
        //     ),
        //     Divider(height: 20, thickness: 2),
        //     Row(
        //       children: [
        //         Icon(
        //           Icons.ads_click_rounded,
        //           color: Color.fromARGB(255, 33, 212, 243),
        //         ),
        //         SizedBox(width: 10),
        //         Text("Ads",
        //             style:
        //                 TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 255),
        //           child: GestureDetector(
        //             child: Icon(
        //               Icons.arrow_forward_ios,
        //               color: Colors.grey[600],
        //             ),
        //             onTap: () {
        //               Navigator.push(context,
        //                   MaterialPageRoute(builder: (context) => ads()));
        //             },
        //           ),
        //         ),
        //       ],
        //     ),
        //     Divider(height: 20, thickness: 2),
        //     Row(
        //       children: [
        //         Icon(
        //           Icons.question_mark_rounded,
        //           color: Color.fromARGB(255, 30, 31, 32),
        //         ),
        //         SizedBox(width: 10),
        //         Text("About",
        //             style:
        //                 TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 235),
        //           child: GestureDetector(
        //             child: Icon(
        //               Icons.arrow_forward_ios,
        //               color: Colors.grey[600],
        //             ),
        //             onTap: () {
        //               Navigator.push(context,
        //                   MaterialPageRoute(builder: (context) => about()));
        //             },
        //           ),
        //         ),
        //       ],
        //     ),
        //     Divider(height: 20, thickness: 2),
        //     Row(
        //       children: [
        //         Icon(
        //           Icons.color_lens_outlined,
        //           color: Color.fromARGB(238, 177, 33, 243),
        //         ),
        //         SizedBox(width: 10),
        //         Text("Theme",
        //             style:
        //                 TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 225),
        //           child: GestureDetector(
        //             child: Icon(
        //               Icons.arrow_forward_ios,
        //               color: Colors.grey[600],
        //             ),
        //             onTap: () {
        //               Navigator.push(context,
        //                   MaterialPageRoute(builder: (context) => theme()));
        //             },
        //           ),
        //         ),
        //         //
        //       ],
        //     ),
        //     Divider(height: 20, thickness: 2),
        //     GestureDetector(
        //       child: Row(
        //         children: [
        //           Icon(
        //             Icons.help,
        //             color: Colors.blue,
        //           ),
        //           SizedBox(width: 10),
        //           Text("Help",
        //               style:
        //                   TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        //           Padding(
        //             padding: const EdgeInsets.only(left: 250),
        //             child: Icon(
        //               Icons.arrow_forward_ios,
        //               color: Colors.grey[600],
        //             ),
        //           ),
        //         ],
        //       ),
        //       onTap: () {
        //         Navigator.push(
        //             context, MaterialPageRoute(builder: (context) => help()));
        //       },
        //     ),
        //     Divider(height: 20, thickness: 2),
        //     Row(
        //       children: [
        //         Icon(
        //           Icons.logout,
        //           color: Color.fromARGB(255, 243, 33, 128),
        //         ),
        //         SizedBox(width: 10),
        //         Text("Logout",
        //             style:
        //                 TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        //         Padding(
        //           padding: EdgeInsets.only(
        //               left: MediaQuery.of(context).size.width - 200),
        //           child: CupertinoSwitch(
        //             value: _switch,
        //             onChanged: (bool val) {
        //               // setState(() {
        //               //   _switch = val;
        //               // });
        //             },
        //           ),
        //         )
        //         // buildNotification(val1, onChangeFunc1),
        //       ],
        //     ),
        //     Divider(height: 20, thickness: 2),
        //   ],
        // ),
      ),
    );
  }

  // Padding buildNotification(bool value, Function onChnageMethod) {
  //
  // Widget build(BuildContext context){

  // }

  // void setState(Null Function() param0) {}
}
