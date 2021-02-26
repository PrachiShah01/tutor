import 'package:flutter/material.dart';
import 'package:tutor/Infopage.dart';
import 'package:tutor/button.dart';
import 'package:tutor/detailPage.dart';
import 'package:tutor/loginScreen.dart';
import 'package:tutor/signupScreen.dart';
import 'package:tutor/welcome.dart';

import 'homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'forgotpass.dart';
import 'detailPage.dart';

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
      home: new tutorApp(),
      routes: {
        '/home': (_) => homeScreen(),
        '/login': (_) => loginScreen(),
        '/signup': (_) => signupScreen(),
        '/forgot': (_) => forgotPass(),
        '/tutorapp': (_) => tutorApp(),
        '/gateway': (_) => gatewayPage(),
        '/detail': (_) => detailPage(),
        //'/info': (_) => infoPage(),
      },
    );
  }
}
