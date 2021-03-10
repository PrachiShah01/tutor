import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutor/pages/homescreen.dart';
import 'package:tutor/pages/splashscreen.dart';
import 'package:tutor/pages/tutorinfo.dart';
import 'package:tutor/pages/tutorlogin.dart';
import 'package:tutor/pages/tutorsignup.dart';
import 'welcomepage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'studentlogin.dart';
import 'studentsignup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.get('email');
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: splashScreen(),
    );
  }
}
