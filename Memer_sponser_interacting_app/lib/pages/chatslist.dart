import 'package:admeme/pages/api.dart';
import 'package:admeme/pages/msg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
import 'dchat.dart';

class chatlist extends StatefulWidget {
  final memer;
  const chatlist({
    Key? key,
    // required this.showRegisterPage,
    required this.memer,
  }) : super(key: key);

  @override
  State<chatlist> createState() => _chatlistState();
}

class _chatlistState extends State<chatlist> {
  List<Map<String, dynamic>> foundusers = [];
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final List<Map<String, dynamic>> _allUsers = [
    {
      'name': 'hari',
      'msg': 'hiiii',
      'msgcount': "0",
      "toid": "MKK0EofdF6gIw1Oe7aNS16IJ1Yh2",
      "profileurl":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2Zlc3Npb25hbCUyMHdvbWFufGVufDB8fDB8fA%3D%3D&w=1000&q=80"
    },
    {
      'name': 'hari',
      'msg': 'hiiii',
      'msgcount': "0",
      "toid": "MKK0EofdF6gIw1Oe7aNS16IJ1Yh2",
      "profileurl":
          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2Zlc3Npb25hbCUyMHdvbWFufGVufDB8fDB8fA%3D%3D&w=1000&q=80"
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    Future init() async {
      final toperson = widget.memer ? "customer" : "memer";
      final fromperson = widget.memer ? "memer" : "customer";
      print(toperson);
      String msg;
      print(uid);
      print(fromperson);

      try {
        final ids = api().fbfs_chat_ids(fromperson, uid);
        ids.then((value) => value.docs.forEach((element) async {
              final id = element.data()['ids'];
              print(id);
              final ref = api().fbfs_profile(toperson, id);
              int count = 1;
              try {
                final last_msg = api().fbfs_chat_unread(fromperson, uid, id);
                last_msg.then((value) => value.size);
              } catch (e) {
                print(e);
              }

              // while (
              //     last_msg.then((value) => value.docs.forEach((element) async {
              //               return await element.data()['recive'];
              //             })) !=
              //         "") {
              //   count++;
              // }
            }));
        // await FirebaseFirestore.instance
        //     .collection("$fromperson/$uid/chats/")
        //     .get()
        //     .then((value) => value.docs.forEach((element) async {
        //           final id = element.data()['ids'];
        //           print(id);
        //           final ref = await FirebaseFirestore.instance
        //               .collection("$toperson")
        //               .doc(id)
        //               .get();
        //           await FirebaseFirestore.instance
        //               .collection("$fromperson/$uid/chats/$id/messages")
        //               .orderBy("sent", descending: true)
        //               .limit(1)
        //               .get()
        //               .then((value) => value.docs.forEach((element) async {
        //                     msg = element.data()['msg'];
        //                     String name = ref.data()!['name'];
        //                     String profileurl = ref.data()!['profileurl'];
        //                     setState(() {
        //                       _allUsers.add({
        //                         "name": name,
        //                         "profileurl": profileurl,
        //                         "msg": msg,
        //                         "msgcount": "1",
        //                         "toid": id,
        //                       });
        //                     });

        //                     print(msg);
        //                     print(name);
        //                   }));
        //         }));
      } catch (e) {
        print("error");
      }
    }

    setState(() {});

    init();

    print(_allUsers);
    setState(() {
      foundusers = _allUsers;
    });
    print(foundusers);
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      if (_allUsers.isEmpty) {}
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      foundusers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 45, 45, 46),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Colors.black,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              style: TextStyle(color: Colors.white),
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 10.0),
                  hintText: "Search Profile",
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.orangeAccent,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orangeAccent),
                      borderRadius: BorderRadius.circular(20))),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: foundusers.isNotEmpty
                  ? ListView.builder(
                      itemCount: foundusers.length,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Color.fromARGB(255, 167, 160, 160)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 4,
                        shadowColor: Color.fromARGB(255, 0, 0, 0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 0, 0),
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          //color: Color.fromARGB(255, 210, 169, 234),
                          // decoration: BoxDecoration(
                          //     gradient: LinearGradient(
                          //   begin: Alignment.topLeft,
                          //   end: Alignment.bottomRight,
                          //   colors: [Color(0xFF3ac3cb), Color(0xFFf85187)],
                          // )),
                          child: ListTile(
                            // shape: RoundedRectangleBorder(
                            //   side: BorderSide(
                            //       color:
                            //           Color.fromARGB(255, 255, 255, 255)),
                            //   borderRadius: BorderRadius.circular(10.0),
                            // ),
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                foundusers[index]['profileurl'],
                              ),
                              backgroundColor:
                                  Color.fromARGB(255, 247, 242, 242),
                            ),
                            title: Text(
                              foundusers[index]['name'],
                              textScaleFactor: 1.2,
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '${foundusers[index]["msg"]}',
                              textScaleFactor: 1.1,
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Text(
                              foundusers[index]["msgcount"],
                              textScaleFactor: 1.2,
                              selectionColor: Colors.blueAccent,
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => chat(
                                    name: foundusers[index]["name"],
                                    profileurl: foundusers[index]["profileurl"],
                                    memer: widget.memer,
                                    toid: foundusers[index]["toid"],
                                    fromid: uid,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'Oops!!..no Profile!',
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    ),
            ),
            // Expanded(
            //   child: foundusers.isNotEmpty
            //       ? ListView.builder(
            //           itemCount: foundusers.length,
            //           itemBuilder: (context, index) => Card(
            //             elevation: 0,
            //             shadowColor: Color.fromARGB(255, 0, 0, 0),
            //             margin: const EdgeInsets.symmetric(vertical: 5),
            //             child: Container(
            //               // decoration: BoxDecoration(
            //               //     gradient: LinearGradient(
            //               //   begin: Alignment.topLeft,
            //               //   end: Alignment.bottomRight,
            //               //   colors: [Color(0xFF3ac3cb), Color(0xFFf85187)],
            //               // )),
            //               child: ListTile(
            //                 shape: RoundedRectangleBorder(
            //                   side: BorderSide(
            //                       color: Color.fromARGB(255, 255, 255, 255)),
            //                   borderRadius: BorderRadius.circular(10.0),
            //                 ),
            //                 leading: CircleAvatar(
            //                   radius: 30.0,
            //                   backgroundImage: NetworkImage(
            //                     foundusers[index]['profileurl'],
            //                   ),
            //                   backgroundColor:
            //                       Color.fromARGB(255, 248, 245, 245),
            //                 ),
            //                 title: Text(
            //                   "instaid",
            //                   textScaleFactor: 1.2,
            //                 ),
            //                 subtitle: Text(
            //                   '${foundusers[index]["msg"]}',
            //                   textScaleFactor: 1.1,
            //                 ),
            //                 trailing: Text(
            //                   foundusers[index]["msgcount"],
            //                   textScaleFactor: 1.3,
            //                   selectionColor: Colors.blueAccent,
            //                 ),
            //                 onTap: () {
            //                   Navigator.push(
            //                     context,
            //                     MaterialPageRoute(
            //                       builder: (context) => chat(
            //                         name: foundusers[index]["name"],
            //                         profileurl: foundusers[index]["profileurl"],
            //                         memer: widget.memer,
            //                         toid: foundusers[index]["toid"],
            //                         fromid: uid,
            //                       ),
            //                     ),
            //                   );
            //                 },
            //               ),
            //             ),
            //           ),
            //         )
            //       : Text(
            //           _allUsers.isEmpty ? "No chats " : 'No Profile Matched!!',
            //           style: TextStyle(fontSize: 15, color: Colors.red),
            //         ),
            // ),
          ],
        ),
      ),
    );
  }
}
