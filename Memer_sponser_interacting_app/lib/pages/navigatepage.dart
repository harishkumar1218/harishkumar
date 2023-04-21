import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:admeme/pages/profile.dart';
import 'package:admeme/pages/trend.dart';

import '../pages/homepage.dart';
import 'notifications.dart';

class navigate extends StatefulWidget {
  const navigate({super.key});

  @override
  State<navigate> createState() => _navigateState();
}

class _navigateState extends State<navigate> {
  final List<Widget> _pages = [
    trend(),
    home(
      memer: false,
    ),
    notificationspg(
      memer: false,
    ),
    profile(
      memer: false,
    ),
  ];

  int _selectedindex = 0;
  void _navigatebottombar(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(child: Text("Users Profiles")),
        backgroundColor: Color.fromARGB(255, 117, 203, 234),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: _pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedindex,
          onTap: _navigatebottombar,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.trending_down_rounded),
                label: "Trending",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: "Notification",
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.black),
          ]),
    );
  }
}
