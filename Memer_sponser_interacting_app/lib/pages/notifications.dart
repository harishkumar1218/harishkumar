import 'package:admeme/af/settings.dart';
import 'package:admeme/pages/locationlist.dart';
import 'package:admeme/pages/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';

int _selectedIndex = 2;

class notificationspg extends StatefulWidget {
  final memer;
  const notificationspg({
    Key? key,
    // required this.showRegisterPage,
    required this.memer,
  }) : super(key: key);

  @override
  State<notificationspg> createState() => _notificationspgState();
}

// class YourData {
//   final String id;
//   final String title;
//   final DateTime date;

//   YourData({required this.id, required this.title, required this.date});

//   factory YourData.fromFirestore(
//       DocumentSnapshot<Map<String, dynamic>> snapshot) {
//     final data = snapshot.data()!;
//     return YourData(
//       id: data['value'],
//       title: data['title'],
//       date: (data['date'] as Timestamp).toDate(),
//     );
//   }
// }

// Future<Map<DateTime, List<YourData>>> getGroupedData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool ismemer = prefs.getBool('ismemer') ?? false;
//   String person = ismemer ? "memer" : "customer";
//   final uid = FirebaseAuth.instance.currentUser!.uid;
//   final snapshot = await FirebaseFirestore.instance
//       .collection('$person/$uid/notification')
//       .get();
//   final data = snapshot.docs.map((doc) => YourData.fromFirestore(doc)).toList();
//   final groupedData = groupBy<YourData, DateTime>(data, (YourData d) => d.date);
//   return groupedData;
//}

class _notificationspgState extends State<notificationspg> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  late List<String> _notifilist = [];
  late String person;
  late CollectionReference notifications;

  //late Future<Map<DateTime, List<YourData>>> _futureGroupedData;

  // Future<List<String>> getNotifications() async {
  //   String person = widget.memer ? "memer" : "customer";

  //   List<String> namesList = [];

  //   try {
  //     QuerySnapshot querySnapshot =
  //         await _firestore.collection('$person/$uid/history').get();
  //     querySnapshot.docs.forEach((doc) {
  //       String name = doc['name'];
  //       _notifilist.add(name);
  //     });
  //     print('Names retrieved successfully!');
  //     setState(() {});
  //   } catch (e) {
  //     print('Error retrieving names: $e');
  //   }

  //   return namesList;
  // }

  @override
  void initState() {
    // TODO: implement initState
    person = widget.memer ? "memer" : "customer";
    notifications =
        FirebaseFirestore.instance.collection('$person/$uid/notification');
    setState(() {
      _selectedIndex = 2;
    });

    //_futureGroupedData = getGroupedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 3,
        centerTitle: true,
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
            Icons.notifications,
            color: Colors.orange,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Center(
              child: Text(
            "Notifications",
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
                  context, MaterialPageRoute(builder: (context) => settings()));
            },
            child: Icon(
              Icons.settings,
              size: 30,
              color: Colors.orangeAccent,
            ),
          )

          // IconButton(
          //   icon: LineIcons.arr,
          //   // icon: Icon(
          //   //   Icons.telegram_sharp,
          //   //   color: Color.fromARGB(255, 95, 166, 224),
          //   //   size: 40,
          //   // ),
          //   onPressed: () {
          //     // do something
          //   },
          // )
        ],
        backgroundColor: Color.fromARGB(255, 45, 45, 46),
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
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
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
                    Navigator.push(
                        context,
                        PageTransition(
                            child: home(
                              memer: widget.memer,
                            ),
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 50)));
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
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         child: profile(
                    //           memer: widget.memer,
                    //         ),
                    //         type: PageTransitionType.bottomToTop,
                    //         duration: Duration(milliseconds: 50)));
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
                  // _selectedIndex = index;
                  // if(_selectedIndex==)
                });
              },
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        stream:
            notifications.orderBy('timestamp', descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<Widget> notificationList = [];
          Map<String, List<DocumentSnapshot>> notificationMap = {};
          snapshot.data!.docs.forEach((document) {
            print(document['timestamp']);
            String date = _getFormattedDate(document['timestamp']);
            if (!notificationMap.containsKey(date)) {
              notificationMap[date] = [];
            }
            notificationMap[date]!.add(document);
          });
          notificationMap.forEach((key, value) {
            notificationList.add(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        key,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(value[index]['userImage']),
                          ),
                          title: Text(
                            value[index]['userName'],
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            value[index]['notification'],
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            _getTimeAgo(value[index]['timestamp']),
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.white),
                          ),
                          onTap: () {
                            // do something when notification is tapped
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          });
          return ListView(children: notificationList);
        },
      ),
    );
  }

  String _getFormattedDate(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    String formattedDate =
        '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    return formattedDate;
  }

  String _getTimeAgo(Timestamp timestamp) {
    DateTime date = timestamp.toDate();
    Duration timeAgo = DateTime.now().difference(date);
    if (timeAgo.inDays > 0) {
      return '${timeAgo.inDays}d ago';
    } else if (timeAgo.inHours > 0) {
      return '${timeAgo.inHours}h ago';
    } else if (timeAgo.inMinutes > 0) {
      return '${timeAgo.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
