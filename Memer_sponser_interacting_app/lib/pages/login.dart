import 'package:admeme/instagram_view.dart';
import 'package:admeme/pages/homepage.dart';
import 'package:admeme/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class mylogin extends StatefulWidget {
  // final VoidCallback showRegisterPage;
  final memer;
  const mylogin({
    Key? key,
    // required this.showRegisterPage,
    required this.memer,
  }) : super(key: key);

  @override
  State<mylogin> createState() => _myloginState();
}

class _myloginState extends State<mylogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signin() async {
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return Center(
    //       child: CircularProgressIndicator(
    //         color: Colors.purple,
    //       ),
    //     );
    //   },
    // );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasSeenOnboarding', true);

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    if (widget.memer) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => InstagramView(
                    islogin: true,
                  ))));
    } else {
      Navigator.push(
          context,
          PageTransition(
              child: home(memer: widget.memer),
              type: PageTransitionType.rightToLeft));
      // Navigator.push(
      // context,
      // MaterialPageRoute(
      //     builder: ((context) => home(
      //           memer: widget.memer,
      //         ))));
    }
    // Navigator.of(context).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      'assets/images/loginimg.jpg',
                    ),
                  ),
                ),
                Text(
                  'Welcome Users!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Login',
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
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: ' Email',
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
                          Border.all(color: Color.fromARGB(255, 230, 237, 234)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: ' Password',
                          border: InputBorder.none,
                        ),
                        obscureText: true,
                      ),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Text('Forgot Password'),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signin,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: (() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                registerpage(memers: widget.memer)));
                      }),
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 118, 201),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
