import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class reportpage extends StatefulWidget {
  const reportpage({super.key});

  @override
  State<reportpage> createState() => _reportpageState();
}

class _reportpageState extends State<reportpage> {
  _sendingMails() async {
    var url = Uri.parse('mailto:freindsforever1234786@gmail.com');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Report'),
        ),
        body: Center(
            child: Container(
          child: Column(
            children: [
              SizedBox(height: 8),
              Text(
                'Report or Feedback',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 16),
              Text(
                "If you're experiencing an issue with our app, we want to hear about it. Our team is committed to providing the best possible user experience, and we rely on user feedback to identify and resolve problems quickly.",
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 8),
              Text(
                "Thank you for helping us improve our app!",
                textAlign: TextAlign.justify,
              ),
              ElevatedButton(
                  onPressed: () {
                    launch(
                        'mailto:freindsforever1234786@gmail.com?subject=This is subject Title & body=This is body of email');
                  },
                  // style: ButtonStyle(
                  //     padding:
                  //         MaterialStateProperty.all(const EdgeInsets.all(5)),
                  //     textStyle: MaterialStateProperty.all(
                  //       const TextStyle(color: Colors.black),
                  //     )),
                  child: const Text('here')),
            ],
          ),
        ))

        // body: Center(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 10),
        //     child: Container(
        //       decoration: BoxDecoration(
        //           color: Color.fromARGB(255, 255, 255, 255),
        //           border: Border.all(color: Colors.black),
        //           borderRadius: BorderRadius.all(Radius.circular(20))),
        //       height: MediaQuery.of(context).size.height * 0.5,
        //       // child: Align(alignment: Alignment.center, child: TextField(

        //       // )),
        //       child: Column(
        //         children: [
        //           SizedBox(
        //             height: 20,
        //           ),
        //           Text(
        //             'Write About The Problem',
        //             style: TextStyle(fontSize: 20),
        //           ),
        //           SizedBox(
        //             height: 100,
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 10),
        //             child: SizedBox(
        //               child: TextField(
        //                 decoration: InputDecoration(
        //                     hintText: 'type here',
        //                     labelText: 'problem',
        //                     contentPadding: EdgeInsets.all(8),
        //                     enabledBorder: OutlineInputBorder(
        //                         borderSide: BorderSide(
        //                             color: Color.fromARGB(255, 0, 0, 0)))),
        //               ),
        //             ),
        //           ),
        //           ElevatedButton(onPressed: () {}, child: Text('Submit'))
        //         ],
        //       ),
        //     ),
        //  ),
        // ),
        );
  }
}
