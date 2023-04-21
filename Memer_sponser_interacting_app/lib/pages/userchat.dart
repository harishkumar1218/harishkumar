import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserChat {
  String instaid;
  String name;
  String imgurl;
  UserChat({
    required this.instaid,
    required this.name,
    required this.imgurl,
  });

  Map<String, String> tojson() {
    return {
      'instaid': instaid,
      "name": name,
      "imgurl": imgurl,
    };
  }

  // factory UserChat.fromDocument(DocumentSnapshot doc) {
  //   String instaid = "";
  //   String name = "";
  //   String imgurl = "";

  // }
}
