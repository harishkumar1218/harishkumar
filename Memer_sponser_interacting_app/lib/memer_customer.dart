import 'package:admeme/instagram_view.dart';
import 'package:admeme/main.dart';
import 'package:admeme/main_page.dart';
import 'package:admeme/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_webview_plugin_ios_android/flutter_webview_plugin_ios_android.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Memer_Customer extends StatefulWidget {
  const Memer_Customer({super.key});

  @override
  State<Memer_Customer> createState() => _Memer_CustomerState();
}

class _Memer_CustomerState extends State<Memer_Customer> {
  Future<bool> _exit() {
    // Call SystemNavigator.pop() to exit the app.
    SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _exit,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                stops: [0.5, 0],
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(247, 255, 255, 255),
                  Color.fromARGB(255, 0, 0, 0)
                ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200.0,
                width: 400.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/memecust.jpg'),
                    // fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  ElevatedButton(
                    onPressed: (() async {
                      SharedPreferences prf =
                          await SharedPreferences.getInstance();
                      prf.setBool('ismemer', true);
                      setState(() {
                        // final simpleAuth.InstagramApi api =
                        //     new simpleAuth.InstagramApi(
                        //         "instagram",
                        //         "534624768606958",
                        //         "a2f8f5c9dc18f5997d717cd6e5237319",
                        //         "https://en.wikipedia.org/wiki/Hello");
                        // var prof = api.authorizationUrl;
                        // print(prof);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => mainpage(memer: true)),
                          ),
                        );
                      });
                    }),
                    child: Text("memer"),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    onPressed: (() async {
                      SharedPreferences prf =
                          await SharedPreferences.getInstance();
                      prf.setBool('ismemer', false);
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => mainpage(
                                  memer: false,
                                )),
                          ),
                        );
                      });
                    }),
                    child: Text("customer"),
                  )
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
