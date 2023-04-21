import 'package:admeme/main_page.dart';
import 'package:admeme/pages/homepage.dart';
import 'package:admeme/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class registercustomer extends StatefulWidget {
  // final VoidCallback showLoginPage;
  final memers;
  const registercustomer({
    Key? key,
    // required this.showRegisterPage,
    required this.memers,
  }) : super(key: key);

  @override
  State<registercustomer> createState() => _registerpageState();
}

class _registerpageState extends State<registercustomer> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _nameController = TextEditingController();
  // final _instagramController = TextEditingController();
  // final _priceController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  String person = "customer";

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _nameController.dispose();

    super.dispose();
  }

  Future signup() async {
    adduserData(_nameController.text.trim(), _emailController.text.trim());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasSeenOnboarding', true);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => home(
                  memer: widget.memers,
                ))));
  }

  Future adduserData(String name, String email) async {
    await FirebaseFirestore.instance.collection(person).doc(user.uid).set({
      'uid': user.uid,
      'name': name,
      'email': user.email,
      'profileurl': "",
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
                  'SignUp',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
