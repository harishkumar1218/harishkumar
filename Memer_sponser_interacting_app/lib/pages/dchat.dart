import 'dart:async';

import 'package:admeme/pages/chatpage.dart';
import 'package:admeme/pages/homepage.dart';
import 'package:admeme/pages/msg.dart';
import 'package:admeme/pages/msg_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:url_launcher/url_launcher.dart';

class dchat extends StatefulWidget {
  final name;
  final profileurl;
  final memer;
  final toid;
  final fromid;
  const dchat({
    Key? key,
    required this.memer,
    required this.toid,
    required this.fromid,
    required this.name,
    required this.profileurl,
  }) : super(key: key);

  @override
  State<dchat> createState() => _dchatState();
}

class _dchatState extends State<dchat> {
  late String person;
  late String toperson;
  String toid = "";
  String fromid = "";
  late StreamController<QuerySnapshot> _streamController1;
  List<Map<String, dynamic>> msgs = [];
  List<Map<String, dynamic>> temp = [];
  final TextEditingController _textController = TextEditingController();
  late StreamController<QuerySnapshot> _streamController;

  @override
  void initState() {
    super.initState();
    toperson = widget.memer ? "customer" : "memer";
    person = widget.memer ? "memer" : "customer";
    toid = widget.toid;
    fromid = widget.fromid;
    _streamController = StreamController<QuerySnapshot>();
    FirebaseFirestore.instance
        .collection('messages')
        .orderBy('sent', descending: true)
        .snapshots()
        .listen((data) {
      _streamController.add(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final document = snapshot.data!.docs[index];
                    final isSender = document['sender'] == 'sender_id';
                    final messageAlign =
                        isSender ? Alignment.centerRight : Alignment.centerLeft;
                    final messageColor =
                        isSender ? Colors.green[100] : Colors.grey[200];

                    return MsgCard(msg: document['text']);
                    // return Align(
                    //   alignment: messageAlign,
                    //   child: Container(
                    //     margin: EdgeInsets.symmetric(vertical: 8.0),
                    //     padding: EdgeInsets.symmetric(
                    //         horizontal: 16.0, vertical: 8.0),
                    //     decoration: BoxDecoration(
                    //       color: messageColor,
                    //       borderRadius: BorderRadius.circular(16.0),
                    //     ),
                    //     child: Text(document['text']),
                    //   ),
                    // );
                  },
                );
              },
            ),
          ),
          Divider(),
          _chatInput()
          // ListTile(
          //   title: TextFormField(
          //     controller: _textController,
          //     decoration: InputDecoration(
          //       hintText: 'Type a message...',
          //     ),
          //   ),
          //   trailing: IconButton(
          //     icon: Icon(Icons.send),
          //     onPressed: () {
          //       FirebaseFirestore.instance.collection('messages').add({
          //         'sender': 'sender_id',
          //         'text': _textController.text,
          //         'timestamp': FieldValue.serverTimestamp(),
          //       });
          //       _textController.clear();
          //     },
          //   ),
          // ),
        ],
      ),

      // body: Column(
      //   children: [
      //     Flexible(
      //       child: StreamBuilder<QuerySnapshot>(
      //         stream: _streamController.stream,
      //         builder: (BuildContext context,
      //             AsyncSnapshot<QuerySnapshot> snapshot) {
      //           if (!snapshot.hasData) {
      //             return Center(
      //               child: CircularProgressIndicator(),
      //             );
      //           }
      //           return ListView(
      //             reverse: true,
      //             children: snapshot.data!.docs.map((document) {
      //               return ListTile(
      //                 title: Text(document['text']),
      //               );
      //             }).toList(),
      //           );
      //         },
      //       ),
      //     ),
      //     Divider(),
      //     ListTile(
      //       title: TextFormField(
      //         controller: _textController,
      //         decoration: InputDecoration(
      //           hintText: 'Type a message...',
      //         ),
      //       ),
      //       trailing: IconButton(
      //         icon: Icon(Icons.send),
      //         onPressed: () {
      //           FirebaseFirestore.instance.collection('messages').add({
      //             'text': _textController.text,
      //             'sent': FieldValue.serverTimestamp(),
      //           });
      //           _textController.clear();
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
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
                                  Navigator.pop(context);
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
                    onPressed: () {
                      FirebaseFirestore.instance.collection('messages').add({
                        'text': _textController.text,
                        'sent': FieldValue.serverTimestamp(),
                      });
                      _textController.clear();
                    },
                    // onPressed: (() {
                    //   setState(() {
                    //     _scrollController.animateTo(
                    //         _scrollController.position.maxScrollExtent,
                    //         duration: Duration(milliseconds: 300),
                    //         curve: Curves.easeOut);
                    //     sendmessage("hari", toid, _textController.text.trim());
                    //     _textController.text = "";
                    //   });
                    //   setState(() {});
                    // }),
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
          // onPressed: (() {
          //   if (_textController.text.isNotEmpty) {
          //     // sendmessage("nisar", toid, _textController.text);
          //   }
          // }),
          onPressed: () {
            FirebaseFirestore.instance.collection('messages').add({
              'text': _textController.text,
              'sent': FieldValue.serverTimestamp(),
            });
            _textController.clear();
          },
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
