import 'package:admeme/af/settings.dart';
import 'package:admeme/pages/locationlist.dart';
import 'package:admeme/pages/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:page_transition/page_transition.dart';

import 'homepage.dart';

int _selectedIndex = 3;

class profile extends StatefulWidget {
  final memer;
  const profile({
    Key? key,
    // required this.showRegisterPage,
    required this.memer,
  }) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _selectedIndex = 3;
    });
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
            Icons.person,
            color: Colors.orange,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Center(
              child: Text(
            "Profile",
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
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //       child: profile(
                    //         memer: widget.memer,
                    //       ),
                    //       type: PageTransitionType.bottomToTop,
                    //       duration: Duration(milliseconds: 50),
                    //     ));
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
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.black, Colors.black],
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://picsum.photos/id/1025/200/200'),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Bio',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Followers',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '10K',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Following',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '100',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                TabBar(labelColor: Colors.white, tabs: [
                  Tab(
                      icon: Icon(
                        Icons.grid_3x3_outlined,
                      ),
                      text: "Post"),
                  Tab(
                    icon: Icon(Icons.play_circle),
                    text: 'Videos',
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 700,
                  color: Color.fromARGB(255, 45, 45, 46),
                  child: GridView.builder(
                      itemCount: 40,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: ListTile(
                                leading: Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.red,
                                ),
                                trailing: Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  'https://picsum.photos/id/1025/200/200'),
                              fit: BoxFit.cover,
                            )),
                          ),
                        );
                      })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
