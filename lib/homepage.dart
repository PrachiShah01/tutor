import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/topright.png',
                width: 200,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    padding: EdgeInsets.all(30),
                    onPressed: () {},
                    child: Text(
                      'I AM TEACHER',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(49),
                    ),
                    elevation: 15,
                    color: Color(0xFFFFB200),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.center,
                  child: RaisedButton(
                    padding: EdgeInsets.all(30),
                    onPressed: () {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      if (auth.currentUser != null) {
                        Navigator.pushNamed(context, '/menu');
                      } else {
                        Navigator.pushNamed(context, '/login');
                      }
                    },
                    child: Text(
                      'I AM STUDENT',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(49),
                    ),
                    elevation: 15,
                    color: Color(0xFF1215EE),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/leftbottom.png',
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
