import 'package:admeme/af/onboardingscreen.dart';
import 'package:admeme/home_page.dart';
import 'package:admeme/main_page.dart';
import 'package:admeme/memer_customer.dart';
import 'package:admeme/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:admeme/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
  bool ismemer = prefs.getBool('ismemer') ?? false;
  await Firebase.initializeApp();

  runApp(MyApp(
    hasSeenOnboarding: hasSeenOnboarding,
    ismemer: ismemer,
  ));
}

class MyApp extends StatefulWidget {
  final bool hasSeenOnboarding;
  final bool ismemer;
  const MyApp(
      {Key? key, required this.hasSeenOnboarding, required this.ismemer})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline3: GoogleFonts.montserrat(
            color: Colors.black,
          ),
        ),
      ),
      darkTheme: ThemeData(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: widget.hasSeenOnboarding
          ? home(memer: widget.ismemer)
          : onBoardingScreen(),
    );
  }
}
