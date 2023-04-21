// import 'package:ads.dart';
import 'package:flutter/material.dart';

class ads extends StatelessWidget {
  const ads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(240, 246, 236, 249),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 190, 113, 238),
        title: Text("Ads",
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
                SizedBox(width: 13),
                Text("General Info",
                    style: TextStyle(
                        fontSize: 22, color: Colors.black.withOpacity(0.8)))
              ],
            ),
            Divider(height: 15, thickness: 1),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 13),
                Text("Data about your activity from partners",
                    style: TextStyle(
                        fontSize: 20, color: Colors.black.withOpacity(0.8)))
              ],
            ),
            SizedBox(height: 13),
            Row(
              children: [
                SizedBox(width: 13),
                Text("Ad Activity",
                    style: TextStyle(
                        fontSize: 20, color: Colors.black.withOpacity(0.8)))
              ],
            ),
            SizedBox(height: 13),
            Row(
              children: [
                SizedBox(width: 13),
                Text("About Ads",
                    style: TextStyle(
                        fontSize: 20, color: Colors.black.withOpacity(0.8)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
