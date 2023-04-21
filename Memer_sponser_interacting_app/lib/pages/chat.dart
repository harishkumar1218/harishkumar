import 'dart:async';

import 'dart:collection';
import 'package:admeme/pages/chatpage.dart';
import 'package:admeme/pages/homepage.dart';
import 'package:admeme/pages/msg.dart';
import 'package:admeme/pages/msg_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:url_launcher/url_launcher.dart';

class chat extends StatefulWidget {
  final name;
  final profileurl;
  final memer;
  final toid;
  final fromid;
  const chat({
    Key? key,
    required this.memer,
    required this.toid,
    required this.fromid,
    required this.name,
    required this.profileurl,
  }) : super(key: key);

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  late String person;
  late String toperson;
  String toid = "";
  String fromid = "";
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  late StreamController<QuerySnapshot> _streamController1;
  List<Map<String, dynamic>> msgs = [];
  List<Map<String, dynamic>> temp = [];
  late final TextEditingController _textController = TextEditingController();
  late ScrollController _scrollController = ScrollController();
  late Stream<List<Map<String, dynamic>>> allmsg;

  Stream<List<Map<String, dynamic>>> init() async* {
    List<Map<String, dynamic>> temp;
    try {
      // await FirebaseFirestore.instance
      //     .collection("$toperson/$toid/chats/$fromid/messages")
      //     .orderBy('sent', descending: true)
      //     .limit(10)
      //     .get()
      //     .then((value) => value.docs.forEach((element) {
      //           msgs.add({
      //             'msg': element.data()['msg'],
      //             'sent': element.data()['sent'],
      //             'recive': element.data()['recive'],
      //             'user': true,
      //           });
      //         }));
      final qs1 = await FirebaseFirestore.instance
          .collection("$toperson/$toid/chats/$fromid/messages")
          .orderBy('sent', descending: true)
          .limit(10)
          .get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshotList = qs1.docs;
      temp = snapshotList.map((snapshot) => snapshot.data()).toList();
      msgs += temp;
    } catch (e) {
      print('empty other chat');
    }
    try {
      // await FirebaseFirestore.instance
      //     .collection("$person/$fromid/chats/$toid/messages")
      //     .orderBy('sent', descending: true)
      //     .limit(10)
      //     .get()
      //     .then((value) => value.docs.forEach((element) {
      //           print(element.data()['msg']);
      //           msgs.add({
      //             'msg': element.data()['msg'],
      //             'sent': element.data()['sent'],
      //             'recive': element.data()['recive'],
      //             'user': false,
      //           });
      //         }));
      final qs2 = await FirebaseFirestore.instance
          .collection("$person/$fromid/chats/$toid/messages")
          .orderBy('sent', descending: true)
          .limit(10)
          .get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> snapshotList = qs2.docs;
      temp = snapshotList.map((snapshot) => snapshot.data()).toList();
      msgs += temp;

      setState(() {});
    } catch (e) {
      print("empty user chat");
    }

    msgs.sort((a, b) => (a['sent']).compareTo(b['sent']));
    yield msgs;
    setState(() {});
  }

  void initState() {
    // TODO: implement initState
    toperson = widget.memer ? "customer" : "memer";
    person = widget.memer ? "memer" : "customer";
    toid = widget.toid;
    fromid = widget.fromid;

    // _streamController1 = StreamController<QuerySnapshot>();
    // FirebaseFirestore.instance
    //     .collection('$toperson/$toid/chats/$fromid/messages')
    //     .orderBy('timestamp', descending: true)
    //     .limit(10)
    //     .snapshots()
    //     .listen((data) {
    //   _streamController1.add(data);
    // });

    setState(() {
      allmsg = init();

      print(temp);
    });

    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    // });
  }

  Future<void> sendmessage(String name, String toid, String msgtext) async {
    toperson = widget.memer ? "customer" : "memer";
    person = widget.memer ? "memer" : "customer";
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      await FirebaseFirestore.instance
          .collection("$toperson/$toid/chats/$fromid/messages")
          .doc(time)
          .set({
        "msg": msgtext,
        "sent": time,
        "recive": "",
        "user": true,
      });
      setState(() {
        _textController.clear();
        initState();
        _scrollController.position.maxScrollExtent;
      });
    } catch (e) {
      print(toid + "+" + person);
    }
  }

  Future<void> _notifi() async {
    try {
      await _firestore.collection('$person/$uid/notification').add({
        'userName': widget.name,
        'timestamp': FieldValue.serverTimestamp(),
        'notification': 'you made a deal with ' + widget.name,
        'userImage': widget.profileurl,
      });
      print('Name added successfully!');
    } catch (e) {
      print('Error adding name: $e');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // void _showdeal(context) {
  //   showBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
  //           child: Text('bottom sheet'),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 23, 23, 23),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Center(
                child: Text(
              widget.name,
              // style: Theme.of(context).textTheme.headline3,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            )),
          ),
          leading: Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_outlined,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  widget.profileurl,
                ),
                backgroundColor: Color.fromARGB(255, 248, 245, 245),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Flexible(
                child: StreamBuilder(
              stream: allmsg,
              builder: ((context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      temp = data!;
                    } else {
                      print("nullll");
                    }

                    if (temp.isNotEmpty) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _scrollController
                            .jumpTo(_scrollController.position.maxScrollExtent);
                      });
                      return Scaffold(
                        body: ListView.builder(
                          controller: _scrollController,
                          //reverse: true,
                          itemCount: temp.length,
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * .01),
                          //physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            print(temp[index]);
                            return MsgCard(msg: temp[index]);
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "chat and make a deal!",
                          style: TextStyle(fontSize: 20),
                        ),
                      );
                    }
                }
              }),
            )),
            _chatInput()
          ],
        ),
      ),
    );
  }

  Widget buildSheet() {
    return Container();
  }

  Widget _chatInput() {
    return Row(
      children: [
        Expanded(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20))),
                          builder: (BuildContext context) {
                            return Center(
                              child: ElevatedButton(
                                child: Text('Deal'),
                                onPressed: () {
                                  _notifi();
                                },
                              ),
                            );
                          });
                    },
                    icon: Icon(
                      Icons.handshake_outlined,
                      color: Colors.black,
                    )),
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  minLines: 1,
                  controller: _textController,
                  decoration: const InputDecoration(
                      hintText: "Message...",
                      hintStyle: TextStyle(color: Colors.black),
                      border: InputBorder.none),
                )),
                IconButton(
                    onPressed: (() {
                      setState(() {
                        _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut);
                        sendmessage("hari", toid, _textController.text.trim());
                        _textController.clear();
                      });
                      setState(() {});
                    }),
                    icon: Icon(
                      Icons.image,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
        ),
        MaterialButton(
          minWidth: 0,
          onPressed: (() {
            if (_textController.text.isNotEmpty) {
              sendmessage("nisar", toid, _textController.text);
              _textController.clear();
            }
          }),
          color: Colors.black,
          shape: CircleBorder(),
          child: Icon(
            Icons.send,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
