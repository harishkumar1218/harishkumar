import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final CollectionReference notifications = FirebaseFirestore.instance
      .collection('customer/siGnLzRwZCaujtXb8BrnTGoOrEs1/notification');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notifications'),
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
                          color: Colors.grey[700],
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
                          title: Text(value[index]['userName']),
                          subtitle: Text(value[index]['notification']),
                          trailing: Text(
                            _getTimeAgo(value[index]['timestamp']),
                            style: TextStyle(
                                fontSize: 12.0, color: Colors.grey[600]),
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
