//import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:admeme/af/settings.dart';
// import 'package:rive/rive.dart';
import 'package:firebase_auth/firebase_auth.dart';

class personalinfopage extends StatefulWidget {
  const personalinfopage({super.key});

  @override
  State<personalinfopage> createState() => _personalinfopageState();
}

class _personalinfopageState extends State<personalinfopage> {
  bool isObscurePassword = true;
  String newimgurl = "";
  var user;
  var _uid;
  void getdata() async {
    user = FirebaseAuth.instance.currentUser!;
    _uid = user.uid;
    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('customer').doc(_uid).get();
    setState(() {
      newimgurl = userDoc.get('profileurl');
    });
  }

  void pickupload() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 60,
    );
    Reference ref = FirebaseStorage.instance.ref().child('profile.jpg');
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      print(value);

      setState(() async {
        await FirebaseFirestore.instance
            .collection('customer')
            .doc(_uid)
            .update({
          'profileurl': value,
        });
        newimgurl = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Edit your profile'),
        // actions: [
        //   IconButton(
        //       icon: Icon(Icons.settings, color: Colors.white),
        //       onPressed: () {
        //         Navigator.of(context)
        //             .push(MaterialPageRoute(builder: (context) => settings()));
        //       })
        // ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            // FocusScope.of(context).unfocus();
            pickupload();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                newimgurl.toString(),
                                //'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdM2_xBCKPufcLo9KaRnz2vbU7-qoHfJoWWg&usqp=CAU'
                              ))),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            color: Colors.blue),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              buildTextField('Full Name', 'name', false),
              buildTextField('Email', 'google@gmail.com', false),
              buildTextField('password', '****', true),
              buildTextField('location', 'place', false),
              buildTextField('phone No', '1234567890', false),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      'cancel',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.black,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "save",
                      style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool ispasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: ispasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: ispasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscurePassword = !isObscurePassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ))
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )),
      ),
    );
  }
}
