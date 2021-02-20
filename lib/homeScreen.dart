import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              child: Image.asset('assets/head.png'),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.only(left: 10),
                      color: Color(0xFF2829A6),
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Engineering',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 210,
                          ),
                          Image.asset(
                            'assets/nextbutton.png',
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(left: 10, right: 0),
                      color: Color(0xFF2829A6),
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Medical',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 245,
                          ),
                          Image.asset(
                            'assets/nextbutton.png',
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(left: 10, right: 0),
                      color: Color(0xFF2829A6),
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/detail');
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Higher Secondary',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 157,
                          ),
                          Image.asset(
                            'assets/nextbutton.png',
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(left: 10, right: 0),
                      color: Color(0xFF2829A6),
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Secondary',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 220,
                          ),
                          Image.asset(
                            'assets/nextbutton.png',
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      padding: EdgeInsets.only(left: 10, right: 0),
                      color: Color(0xFF2829A6),
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Primary',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 245,
                          ),
                          Image.asset(
                            'assets/nextbutton.png',
                            width: 30,
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushNamed(context, '/gateway');
                      },
                      child: Text(
                        'Sign out',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
