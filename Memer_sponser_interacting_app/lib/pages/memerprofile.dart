import 'dart:ui';

import 'package:admeme/pages/chatfinal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:admeme/pages/chat.dart';

import 'dchat.dart';
// import 'package:admeme/pages/grid.dart';

class clickprofile extends StatelessWidget {
  final Map<String, dynamic> lis;
  final fromid;
  final memerid;
  final memer;
  clickprofile({
    Key? key,
    required this.fromid,
    required this.memerid,
    required this.lis,
    required this.memer,
  }) : super(key: key);

  get index => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 45, 45, 46),
        centerTitle: true,
        title: Text('profile of memer'),
      ),
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            children: [
              // MAIN CONTAINER..................
              Container(
                color: Colors.black,
                // decoration: BoxDecoration(
                //   border: Border.all(
                //       color: Color.fromARGB(255, 163, 184, 29), width: 2),
                //   // color: Colors.red,
                // ),
                // height: (MediaQuery.of(context).size.height) * 1,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(lis['image']),
                      radius: 60,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Username : ' + lis['name'],
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 70,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 51, 3, 136),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              'Followers' + '\n' + lis['followrs'],
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 65, 11, 96),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text('Price' + '\n' + lis['price'],
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Want to promote!!',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => chat(
                                          name: lis["name"],
                                          profileurl: lis['image'],
                                          toid: memerid,
                                          memer: memer,
                                          fromid: fromid,
                                        )));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ChatPage(
                            //             senderId: fromid,
                            //             receiverId: memerid)));
                          },
                          icon: Icon(Icons.chat),
                          label: Text('Chat')),
                    ),
                    SizedBox(
                      height: 10,
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
                    SingleChildScrollView(
                      child: Container(
                        height: 700,
                        color: Color.fromARGB(255, 45, 45, 46),
                        child: GridView.builder(
                            itemCount: 40,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                    image: NetworkImage(lis['image']),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                              );
                            })),
                      ),
                    ),
                  ],
                ),
              ),

              // Container(
              //   height: (MediaQuery.of(context).size.height) * 0.5,
              //   color: Color.fromARGB(255, 71, 184, 40),
              // ),
              // Container(
              //   height: (MediaQuery.of(context).size.height) * 0.5,
              //   color: Color.fromARGB(255, 203, 188, 145),
              // ),
            ],
          )),
        ),
      ),
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: LimitedBox(
      //       child: Column(
      //         children: [
      //           Center(
      //             child: Container(
      //               child: Column(
      //                 children: [
      //                   SizedBox(
      //                     height: 10,
      //                   ),
      //                   CircleAvatar(
      //                     backgroundImage: NetworkImage(lis['image']),
      //                     radius: 50,
      //                   ),
      //                   SizedBox(height: 10),
      //                   Text(
      //                     lis['name'],
      //                     style: TextStyle(
      //                         fontSize: 20, fontWeight: FontWeight.bold),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Center(
      //             child: Column(
      //               children: [
      //                 Container(
      //                   height: MediaQuery.of(context).size.height,
      //                   width: MediaQuery.of(context).size.width,
      //                   //color: Color.fromARGB(255, 230, 161, 251),
      //                   decoration: BoxDecoration(
      //                       color: Color.fromARGB(255, 222, 217, 217),
      //                       border: Border.all(
      //                         color: Colors.transparent,
      //                       ),
      //                       borderRadius:
      //                           BorderRadius.all(Radius.circular(15))),
      //                   child: Column(
      //                     children: [
      //                       SizedBox(
      //                         height: 20,
      //                       ),
      //                       Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                         children: [
      //                           Container(
      //                               height: 70,
      //                               width: 110,
      //                               decoration: BoxDecoration(
      //                                   borderRadius: BorderRadius.all(
      //                                       Radius.circular(12)),
      //                                   color:
      //                                       Color.fromARGB(255, 76, 13, 105)),
      //                               child: Center(
      //                                   child: Text(
      //                                 'Followers' + '\n   ' + lis['id'],
      //                                 style: TextStyle(color: Colors.white),
      //                               ))),
      //                           Container(
      //                               height: 70,
      //                               width: 110,
      //                               decoration: BoxDecoration(
      //                                   borderRadius: BorderRadius.all(
      //                                       Radius.circular(12)),
      //                                   color: Color.fromARGB(255, 37, 13, 49)),
      //                               child: Center(
      //                                   child: Text(
      //                                 'Price' + '\n' + lis['price'],
      //                                 style: TextStyle(color: Colors.white),
      //                               ))),
      //                         ],
      //                       ),
      //                       SizedBox(
      //                         height: 20,
      //                       ),
      //                       Align(
      //                         alignment: Alignment.topCenter,
      //                         child: Padding(
      //                           padding:
      //                               const EdgeInsets.symmetric(horizontal: 50),
      //                           child: ElevatedButton(
      //                               style: ButtonStyle(
      //                                   shape: MaterialStateProperty.all<
      //                                           RoundedRectangleBorder>(
      //                                       RoundedRectangleBorder(
      //                                           borderRadius:
      //                                               BorderRadius.circular(18.0),
      //                                           side: BorderSide(
      //                                               color: Color.fromARGB(
      //                                                   255, 255, 255, 7))))),
      // onPressed: () =>
      // Navigator.of(context).push(
      //     MaterialPageRoute(
      //         builder: (context) => const Homepage())),
      //                               child: Row(
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.center,
      //                                 children: [
      //                                   Text('Chat '),
      //                                   Icon(Icons.chat_bubble_outline)
      //                                 ],
      //                               )),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
