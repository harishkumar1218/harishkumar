import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class security extends StatelessWidget {
  const security({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(240, 246, 236, 249),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 113, 238),
        title: Text("Security", style: TextStyle(fontSize: 28)),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 20, 20, 20),
            )),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            SizedBox(height: 18),

            Row(
              children: [
                Icon(
                  Icons.key,
                  color: Color.fromARGB(255, 243, 33, 180),
                ),
                SizedBox(width: 7),
                Text("Password Change",
                    style: TextStyle(
                        fontSize: 22, color: Colors.black.withOpacity(0.8))),
                Padding(
                  padding: const EdgeInsets.only(left: 224),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),

            Divider(height: 20, thickness: 2),

            // Row(
            //   children: [
            //     Icon(
            //       Icons.,
            //       color: Color.fromARGB(255, 55, 188, 245),
            //     ),
            //     SizedBox(width: 10),
            //     Text("Login Activity",
            //         style: TextStyle(
            //             fontSize: 22, color: Colors.black.withOpacity(0.8))),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 188),
            //       child: Icon(
            //         Icons.arrow_forward_ios,
            //         color: Colors.grey[600],
            //       ),
            //     ),
            //   ],
            // ),
            // Divider(height: 20, thickness: 2),
            Row(
              children: [
                Icon(
                  Icons.login_sharp,
                  color: Color.fromARGB(255, 160, 57, 245),
                ),
                SizedBox(width: 10),
                Text("Saved login information",
                    style: TextStyle(
                        fontSize: 22, color: Colors.black.withOpacity(0.8))),
                Padding(
                  padding: const EdgeInsets.only(left: 88),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Divider(height: 20, thickness: 2),

            Row(
              children: [
                Icon(
                  Icons.domain_verification,
                  color: Color.fromARGB(255, 7, 98, 32),
                ),
                SizedBox(width: 10),
                Text("Two-factor authentication",
                    style: TextStyle(
                        fontSize: 22, color: Colors.black.withOpacity(0.8))),
                Padding(
                  padding: const EdgeInsets.only(left: 68),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Divider(height: 20, thickness: 2),
            Row(
              children: [
                Icon(
                  Icons.security,
                  color: Color.fromARGB(255, 85, 242, 127),
                ),
                SizedBox(width: 10),
                Text("Security Checkup",
                    style: TextStyle(
                        fontSize: 22, color: Colors.black.withOpacity(0.8))),
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Divider(height: 20, thickness: 2),

            // SizedBox(
            //   height: 10,
            //)
          ],
        ),
      ),
    );
  }
}
