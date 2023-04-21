// import 'dart:async';

// import 'package:admeme/list.dart';
// import 'package:admeme/pages/homepage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// import 'package:internet_connection_checker/internet_connection_checker.dart';

// class instafectherroe implements Exception {
//   String cause;
//   instafectherroe(this.cause);
// }

// class homepage extends StatefulWidget {
//   const homepage({super.key});

//   @override
//   State<homepage> createState() => _homepageState();
// }

// class _homepageState extends State<homepage> {
//   final user = FirebaseAuth.instance.currentUser!;

//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   getId();
//   //   super.initState();
//   // }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('successfully signed ' + user.email!),
//           MaterialButton(
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//             },
//             color: Colors.purple,
//             child: Text('sign out'),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: GestureDetector(
//               onTap: null,
//               child: Container(
//                 padding: EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Center(
//                   child: Text('followers:',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold)),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: ElevatedButton(
//               onPressed: () => {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => home(memer: ),
//                   ),
//                 )
//               },
//               child: Container(
//                 padding: EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Center(
//                   child: Text(
//                     'Search',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }
