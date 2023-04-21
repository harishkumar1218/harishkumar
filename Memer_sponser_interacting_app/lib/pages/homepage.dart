//import 'package:myap/home_page.dart';
import 'dart:convert';
import 'package:admeme/af/notifications.dart';
import 'package:admeme/pages/locationlist.dart';
import 'package:admeme/pages/notifications.dart';
import 'package:admeme/pages/profile.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:admeme/pages/navigatepage.dart';
import 'package:admeme/home_page.dart';
import 'package:admeme/main_page.dart';
import 'package:admeme/pages/chat.dart';
import 'package:admeme/pages/chatslist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:admeme/main.dart';
import 'package:admeme/pages/msg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:admeme/pages/memerprofile.dart';
import 'package:admeme/pages/date.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  final memer;
  const home({
    Key? key,
    // required this.showRegisterPage,
    required this.memer,
  }) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

int _selectedIndex = 0;
final List<Map<String, dynamic>> _allUsers = [];
// Future<int> instafolloers(String name) async {
//   // final token = await SharedPreferences.getInstance();
//   // final val = token.get('token') ?? 0;
//   // Map<String, String> requestHeaders = {
//   //   'Content-type': 'application/json',
//   //   'Accept': 'application/json',
//   //   'Authorization': "Bearer $val"
//   // };
//   var url1 = Uri.parse("https://www.instagram.com/$name/?__a=1&__d=dis");
//   var res = await http.get(url1);
//   var prof = jsonDecode(res.body);
//   print(prof);
//   int flow = prof['graphql']['user']['edge_followed_by']['count'];
//   int flow = 5;
//   return flow;
// }

// Future instaimg(String name) async {
//   if (name != null) {
//     final token = await SharedPreferences.getInstance();
//     final val = token.get('token') ?? 0;
//     Map<String, String> requestHeaders = {
//       'Content-type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': "Bearer $val"
//     };
//     var url1 = Uri.parse("https://www.instagram.com/$name/?__a=1");
//     var res = await http.get(url1, headers: requestHeaders);
//     var prof = jsonDecode(jsonEncode(res.body));
//     // print(prof);
//     String img = prof['graphql']['user']['profile_pic_url_hd'];
//     return img;
//   }
// }

class _homeState extends State<home> {
  List<Map<String, dynamic>> foundusers = [];
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _allUsers = [];
  //   super.dispose();
  // }

  @override
  void initState() {
    Future init() async {
      if (_allUsers.isEmpty) {
        await FirebaseFirestore.instance.collection("memer").get().then(
              (value) => value.docs.forEach((element) async {
                //_getid[element.data()['name']] = [element.data()['age']];
                String name = element.data()['name'];
                String insta = element.data()['instaid'] ?? "__hacker__76";
                String price = element.data()['price'].toString();
                String memerid = element.data()['uid'];
                String email = element.data()['email'];
                String location = element.data()['location'];

                print(name);

                try {
                  var url1 = Uri.parse(
                      "https://www.instagram.com/$insta/?__a=1&__d=dis");
                  var res = await http.get(url1);
                  var prof = jsonDecode(res.body);
                  print(prof);
                  int flowcoun =
                      prof['graphql']['user']['edge_followed_by']['count'];
                  String imgurl = prof['graphql']['user']['profile_pic_url_hd'];

                  setState(() {
                    _allUsers.add(
                      {
                        "memerid": memerid,
                        "instaid": insta,
                        'name': element.data()['name'],
                        "followrs": flowcoun.toString(),
                        "price": price,
                        "image": imgurl,
                        "location": location,
                      },
                    );
                  });
                } catch (e) {
                  print("error3");
                }
              }),
            );
      } else {
        print("_alluser is not emty");
      }
    }

    // TODO: implement initState
    setState(() {
      _selectedIndex = 0;
    });
    init();
    print(_allUsers);

    foundusers = _allUsers;

    super.initState();
  }

  Future<void> _history(String name) async {
    String person = widget.memer ? "memer" : "customer";
    try {
      await _firestore
          .collection('$person/$uid/history')
          .doc(name)
          .set({'name': name});
      print('Name added successfully!');
    } catch (e) {
      print('Error adding name: $e');
    }
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];

    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) => user["instaid"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      foundusers = results;
    });
  }

  Future<bool> _exit() {
    // Call SystemNavigator.pop() to exit the app.
    SystemNavigator.pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _exit,
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Center(
                child: Text(
              "Memers",
              // style: Theme.of(context).textTheme.headline3,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            )),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Color.fromARGB(255, 45, 45, 46),
              ),
              onPressed: () async {
                Navigator.push(
                    context,
                    PageTransition(
                        child: chatlist(
                          memer: widget.memer,
                        ),
                        type: PageTransitionType.rightToLeft));
              },
              child: Icon(
                LineIcons.facebookMessenger,
                size: 30,
                color: Colors.orangeAccent,
              ),
            )
          ],
          backgroundColor: Color.fromARGB(255, 45, 45, 46),
          leading: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: Color.fromARGB(255, 45, 45, 46),
            ),
            onPressed: () {
              // Share.share(
              //     "https://play.google.com/store/apps/developer?id=Instagram");
            },
            child: Icon(
              Icons.share,
              color: Colors.orange,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 51, 48, 48),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Color.fromARGB(255, 255, 0, 0)!,
                hoverColor: Color.fromARGB(255, 0, 255, 247)!,
                gap: 0,
                activeColor: Color.fromARGB(255, 0, 0, 0),
                iconSize: 22,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 300),
                tabBackgroundColor: Color.fromARGB(255, 211, 162, 229)!,
                color: Colors.orangeAccent,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     PageTransition(
                      //         child: home(
                      //           memer: widget.memer,
                      //         ),
                      //         type: PageTransitionType.bottomToTop,
                      //         duration: Duration(milliseconds: 50)));
                    },
                  ),
                  GButton(
                    //icon: LineIcons.locationArrow,
                    text: 'Location', icon: Icons.location_on,
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: locationlist(
                                memer: widget.memer,
                              ),
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 50)));
                    },
                  ),
                  GButton(
                    icon: LineIcons.bell,
                    text: 'Notification',
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: notificationspg(
                                memer: widget.memer,
                              ),
                              type: PageTransitionType.fade,
                              duration: Duration(milliseconds: 50)));
                    },
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            child: profile(
                              memer: widget.memer,
                            ),
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 50),
                          ));
                    },
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),

        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // Color.fromARGB(255, 183, 157, 235),
              Color.fromARGB(255, 8, 1, 1),
              Color.fromARGB(255, 0, 0, 0)
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 12, right: 12),
            child: Column(
              children: [
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) => _runFilter(value),
                  onSubmitted: (value) => _history(value),
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
                const SizedBox(height: 10),
                Expanded(
                  child: foundusers.isNotEmpty
                      ? ListView.builder(
                          itemCount: foundusers.length,
                          itemBuilder: (context, index) => Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 167, 160, 160)),
                              borderRadius: BorderRadius.circular(20.0),
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
                                      BorderRadius.all(Radius.circular(18))),
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
                                    foundusers[index]['image'],
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 247, 242, 242),
                                ),
                                title: Text(
                                  foundusers[index]['instaid'],
                                  textScaleFactor: 1.2,
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  foundusers[index]["followrs"],
                                  textScaleFactor: 1.1,
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Text(
                                  foundusers[index]["price"],
                                  textScaleFactor: 1.2,
                                  selectionColor: Colors.blueAccent,
                                  style: TextStyle(color: Colors.white),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => clickprofile(
                                          memer: widget.memer,
                                          fromid: uid,
                                          lis: foundusers[index],
                                          memerid: foundusers[index]
                                              ["memerid"]),
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
              ],
            ),
          ),
        ),
        // floatingActionButton: new FloatingActionButton(
        //     elevation: 0.0,
        //     child: new Icon(
        //       Icons.refresh,
        //       color: Colors.black,
        //     ),
        //     backgroundColor: new Color(0xFFE57373),
        //     onPressed: () {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => home()));
        //     })
      ),
    );
  }
}
