import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class infoPage extends StatefulWidget {
  @override
  _infoPageState createState() => _infoPageState();
}

class _infoPageState extends State<infoPage> {
  Query _ref;
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('HigherSecondary')
        .child('Science')
        .child('Biology');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
