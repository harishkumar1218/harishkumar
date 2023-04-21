import 'dart:developer';

import 'package:admeme/auth_page.dart';
import 'package:admeme/pages/homepage.dart';
import 'package:admeme/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';

class mainpage extends StatelessWidget {
  final memer;
  const mainpage({Key? key, required this.memer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return home(
              memer: memer,
            );
          } else {
            return mylogin(memer: memer);
          }
        }),
      ),
    );
  }
}
