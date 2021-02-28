import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class menuScreen extends StatefulWidget {
  @override
  _menuScreenState createState() => _menuScreenState();
}

class _menuScreenState extends State<menuScreen> {
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
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          HomeButton(
                            label: 'Primary',
                            onpressed: () {
                              Navigator.pushNamed(context, '/list');
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          HomeButton(
                            label: 'Secondary',
                            onpressed: () {
                              Navigator.pushNamed(context, '/list');
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          HomeButton(
                            label: 'Higher',
                            onpressed: () {
                              Navigator.pushNamed(context, '/list');
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          HomeButton(
                            label: 'Engineering',
                            onpressed: () {
                              Navigator.pushNamed(context, '/list');
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          HomeButton(
                            label: 'Medical',
                            onpressed: () {
                              Navigator.pushNamed(context, '/list');
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          HomeButton(
                            label: '',
                            onpressed: () {
                              Navigator.pushNamed(context, '/list');
                            },
                          ),
                        ],
                      ),
                      FlatButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Sign out',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  HomeButton({this.label, this.onpressed});
  final String label;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        padding: EdgeInsets.all(25),
        color: Color(0xFF2829A6),
        shape: new RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        onPressed: onpressed,
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
