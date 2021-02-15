import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:tutor/button.dart';
import 'constants.dart';

class tutorApp extends StatefulWidget {
  @override
  _tutorAppState createState() => _tutorAppState();
}

class _tutorAppState extends State<tutorApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      image: Image.asset('assets/tutorappicon.png'),
      photoSize: 150,
      seconds: 3,
      loaderColor: Colors.blue,
      navigateAfterSeconds: gatewayPage(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/mainscreenimage.png',
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Welcome',
            style: TextStyle(
                color: Color(0xFF4547ED),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Find the best tutor in your city',
            style: TextStyle(color: Color(0xFF4547ED), fontSize: 15),
          ),
          SizedBox(
            height: 30,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(49),
            child: FlatButton(
              child: Text(
                'Login',
                style: kButtonTextStyle,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              color: kButtonColor,
              height: 50,
              minWidth: 300,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(49),
            child: FlatButton(
              child: Text(
                'Register',
                style: kButtonTextStyle,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              color: kButtonColor,
              height: 50,
              minWidth: 300,
            ),
          ),
        ],
      ),
    );
  }
}
