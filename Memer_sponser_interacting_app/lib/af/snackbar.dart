import 'package:flutter/material.dart';
import 'package:admeme/pages/login.dart';

class snackbarpage extends StatelessWidget {
  const snackbarpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('no internet!'),
        backgroundColor: Colors.green,
      ),
    );
  }
}
