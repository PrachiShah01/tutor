import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'welcomepage.dart';

class splashScreen extends StatelessWidget {
  static String idScreen = "splashScreen";
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      imageBackground: AssetImage('assets/welcome.png'),
      seconds: 3,
      loaderColor: Colors.blue,
      navigateAfterSeconds: welcomePage(),
    );
  }
}
