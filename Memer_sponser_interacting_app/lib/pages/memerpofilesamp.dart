import 'package:flutter/material.dart';

class InstagramProfilePage extends StatefulWidget {
  @override
  _InstagramProfilePageState createState() => _InstagramProfilePageState();
}

class _InstagramProfilePageState extends State<InstagramProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.parallax,

                title: Column(
                  children: [
                    SizedBox(
                      height: 75,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://source.unsplash.com/random/800x600'),
                      radius: 60,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Username : ' + 'afreed',
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
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 51, 3, 136),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              'Followers' + '\n' + '55',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 110,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 65, 11, 96),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text('Price' + '\n' + '20',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    Text(
                      'Want to promote!!',
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purpleAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => chat(
                            //               name: lis["name"],
                            //               profileurl: lis['image'],
                            //               toid: memerid,
                            //               memer: memer,
                            //               fromid: fromid,
                            //             )));
                          },
                          icon: Icon(Icons.chat),
                          label: Text('Chat')),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                // title: Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Followers: ',
                //       style: TextStyle(
                //         fontSize: 16.0,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     Text(
                //       '1000',
                //       style: TextStyle(
                //         fontSize: 16.0,
                //         color: Colors.white,
                //       ),
                //     ),
                //     SizedBox(width: 10.0),
                //     Text(
                //       'Following: ',
                //       style: TextStyle(
                //         fontSize: 16.0,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     Text(
                //       '500',
                //       style: TextStyle(
                //         fontSize: 16.0,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),

                background: Stack(
                  children: [
                    Image.network(
                      'https://source.unsplash.com/random/800x600',
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      right: 0.0,
                      bottom: 0.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage: NetworkImage(
                              'https://source.unsplash.com/random/300x300',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottom: TabBar(
                controller: _tabController,
                tabs: <Widget>[
                  Tab(text: 'Posts'),
                  Tab(text: 'Tagged'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            _buildPostsGridView(),
            _buildTaggedPostsGridView(),
          ],
        ),
      ),
    );
  }

  Widget _buildPostsGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          'https://source.unsplash.com/random/${index + 100}',
          fit: BoxFit.cover,
        );
      },
    );
  }

  Widget _buildTaggedPostsGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 2.0,
      ),
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          'https://source.unsplash.com/random/${index + 200}',
          fit: BoxFit.cover,
        );
      },
    );
  }
}
