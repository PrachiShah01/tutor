import 'package:flutter/material.dart';
import 'package:tutor/homepage.dart';
import 'package:tutor/tutorlist.dart';
import 'package:tutor/loginScreen.dart';
import 'package:tutor/signupScreen.dart';
import 'package:tutor/splashscreenPage.dart';
import 'menuScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'forgotpass.dart';
import 'tutorlist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new splashScreen(),
      routes: {
        '/menu': (_) => menuScreen(),
        '/login': (_) => loginScreen(),
        '/signup': (_) => signupScreen(),
        '/forgot': (_) => forgotPass(),
        '/home': (_) => homePage(),
        '/list': (_) => tutorlistPage(),
        '/menu': (_) => menuScreen(),
      },
    );
  }
}
