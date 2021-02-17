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
      appBar: AppBar(
        title: Text(
          'Tutor',
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: <Widget>[
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
    );
  }
}
