import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class api {
  Future<QuerySnapshot<Map<String, dynamic>>> fbfs_chat_ids(
      String collection, String id) async {
    return await FirebaseFirestore.instance
        .collection("$collection/$id/chats")
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fbfs_profile(
      String collection, String id) async {
    return await FirebaseFirestore.instance
        .collection(collection)
        .doc(id)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fbfs_chat(
      String from, String fromid, String to, String toid, int count) async {
    return await FirebaseFirestore.instance
        .collection("$from/$fromid/chats/$toid/messages")
        .orderBy("sent", descending: true)
        .limit(count)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fbfs_chat_unread(
    String from,
    String fromid,
    String toid,
  ) async {
    return await FirebaseFirestore.instance
        .collection("$from/$fromid/chats/$toid/messages")
        .orderBy("sent", descending: true)
        .where('recive', isEqualTo: '')
        .get();
  }
}
