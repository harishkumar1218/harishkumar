import 'package:admeme/af/notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class notifications extends StatelessWidget {
  const notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(240, 246, 236, 249),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 113, 238),
        title: Text("Notifications",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            SizedBox(height: 18),
            Row(
              children: [
                Text("Mute all",
                    style: TextStyle(
                        fontSize: 22, color: Colors.black.withOpacity(0.8))),
                Padding(
                  // padding: const EdgeInsets.only(right: 2),
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width - 155),
                  child: CupertinoSwitch(
                    value: false,
                    onChanged: (bool val) {},
                  ),
                )
              ],
            ),
            SizedBox(height: 13),
            Row(
              children: [
                // SizedBox(width: 13),
                Text("Messages",
                    style: TextStyle(
                        fontSize: 22, color: Colors.black.withOpacity(0.8)))
              ],
            ),
            SizedBox(height: 13),
            Row(
              children: [
                GestureDetector(
                    onTap: () {},
                    child: Text("Following and Followers",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black.withOpacity(0.8))))
              ],
            ),
            SizedBox(height: 13),
            Row(
              children: [
                Text("Email notifications",
                    style: TextStyle(
                        fontSize: 22, color: Colors.black.withOpacity(0.8)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
