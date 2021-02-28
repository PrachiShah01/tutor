import 'package:flutter/material.dart';
import 'file:///D:/Project/FlutterProject/tutor/lib/pages/homepage.dart';
import 'file:///D:/Project/FlutterProject/tutor/lib/pages/loginScreen.dart';
import 'file:///D:/Project/FlutterProject/tutor/lib/pages/signupScreen.dart';
import 'file:///D:/Project/FlutterProject/tutor/lib/pages/splashscreenPage.dart';
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
        '/list': (_) => tutorlist(),
        '/menu': (_) => menuScreen(),
      },
    );
  }
}
