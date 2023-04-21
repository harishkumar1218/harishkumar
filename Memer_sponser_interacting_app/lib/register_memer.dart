import 'package:admeme/main_page.dart';
import 'package:admeme/pages/homepage.dart';
import 'package:admeme/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class registermemer extends StatefulWidget {
  final memers;
  final instaid;
  const registermemer({
    Key? key,
    // required this.showRegisterPage,
    required this.memers,
    required this.instaid,
  }) : super(key: key);

  @override
  State<registermemer> createState() => _registermemerState();
}

class _registermemerState extends State<registermemer> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _priceController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  String person = "memer";

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _locationController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future signup() async {
    adduserData(
      _nameController.text.trim(),
      int.parse(_priceController.text.trim()),
      _locationController.text.trim(),
      widget.instaid,
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasSeenOnboarding', true);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => home(
                  memer: widget.memers,
                ))));
  }

  Future adduserData(String name, int price, String loc, String insta) async {
    await FirebaseFirestore.instance.collection(person).doc(user.uid).set({
      'uid': user.uid,
      'instaid': insta,
      'name': name,
      'email': user.email,
      'price': price,
      'location': loc,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 145, 218, 150),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(
                      'assets/images/signup.jpg',
                    ),
                  ),
                ),
                Text(
                  'Register..',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Fill Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color.fromARGB(255, 233, 238, 236)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: ' Name',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color.fromARGB(255, 233, 238, 236)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        widget.instaid,
                      ),
                      // child: TextField(
                      //   controller: _instagramController,
                      //   decoration: InputDecoration(
                      //     hintText: ' instagram id',
                      //     border: InputBorder.none,
                      //   ),
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color.fromARGB(255, 233, 238, 236)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _priceController,
                        decoration: InputDecoration(
                          hintText: ' price',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color.fromARGB(255, 233, 238, 236)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _locationController,
                        decoration: InputDecoration(
                          hintText: ' Location',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signup,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
