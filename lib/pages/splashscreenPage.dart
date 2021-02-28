import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'file:///D:/Project/FlutterProject/tutor/lib/pages/homepage.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      imageBackground: AssetImage('assets/welcome.png'),
      seconds: 3,
      loaderColor: Colors.blue,
      navigateAfterSeconds: homePage(),
    );
  }
}
