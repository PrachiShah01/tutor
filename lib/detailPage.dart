import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class detailPage extends StatefulWidget {
  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  Query _ref;
  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('HigherSecondary')
        .child('Science')
        .child('Biology');
  }

  Widget _buildTutorItem({Map Biology}) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        borderOnForeground: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/info');
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.black54,
                      size: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      Biology['Name'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.black54,
                    size: 20,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    Biology['Email'],
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.call,
                    color: Colors.black54,
                    size: 20,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    Biology['MobileNumber'].toString(),
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            height: double.infinity,
            child: FirebaseAnimatedList(
              query: _ref,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map biology = snapshot.value;
                return _buildTutorItem(Biology: biology);
              },
            ),
          ),
        ),
      ),
    );
  }
}
