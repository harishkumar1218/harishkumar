import 'dart:async';

import 'package:lottie/lottie.dart';
import 'package:admeme/main_page.dart';
import 'package:admeme/pages/login.dart';
import 'package:flutter/material.dart';
import '../pages/login.dart';
import 'package:admeme/memer_customer.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  List onBoardingData = [
    {
      "image": 'assets/images/f1.json',
      "title": 'choose your promoter!!!',
      "description": 'hello world',
    },
    {"image": 'assets/images/f2.json', "title": 'chat and make a deal!!!'},
    {
      "image": 'assets/images/f3.json',
      "title": 'your ad promoted succesfully!!!'
    }
  ];

  Color whiteColor = Colors.white;
  Color othercolor = Color.fromARGB(255, 0, 0, 0);

  PageController pageController = PageController();
  continueMethod() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Memer_Customer()),
        (Route<dynamic> route) => false);
  }

  int currentPage = 0;
  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: othercolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: continueMethod,
            child: Text(
              'skip',
              style: TextStyle(color: whiteColor),
            ),
          ),
        ],
      ),
      body: Stack(children: [
        PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          itemCount: onBoardingData.length,
          onPageChanged: onChanged,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Lottie.asset(onBoardingData[index]['image']),
                  Text(
                    onBoardingData[index]['title'],
                    style: TextStyle(fontSize: 20, color: whiteColor),
                  )
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              (currentPage == (onBoardingData.length - 1))
                  ? ElevatedButton(
                      onPressed: continueMethod,
                      child: const Text('CONTINUE'),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        onBoardingData.length,
                        (index) {
                          return AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 200,
                            ),
                            height: 10,
                            width: (index == currentPage) ? 20 : 10,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: (index == currentPage)
                                    ? Colors.white
                                    : Colors.grey),
                          );
                        },
                      ),
                    ),
            ],
          ),
        )
      ]),
    );
  }
}
