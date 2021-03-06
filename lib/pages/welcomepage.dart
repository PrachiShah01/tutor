import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:tutor/pages/courseScreen.dart';
import 'package:tutor/pages/homescreen.dart';
import 'package:tutor/pages/tutorhome.dart';
import 'bio.dart';
import 'tutorinfo.dart';
import 'studentlogin.dart';
import 'tutorlogin.dart';

String finalEmail;

class welcomePage extends StatefulWidget {
  @override
  _welcomePageState createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  final User user = FirebaseAuth.instance.currentUser;
  final User studentuser = FirebaseAuth.instance.currentUser;

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
                buttonstyle(
                  title: 'I AM TEACHER',
                  color: Colors.amber,
                  onpressed: () async {
                    //getValidationData();

                    if (user != null) {
                      var a = await FirebaseFirestore.instance
                          .collection('tutor')
                          .doc(user.email)
                          .get();
                      if (a.exists) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => tutorbio(),
                          ),
                        );
                      } else {
                        Toast.show("User is not registered as tutor", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.CENTER);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => tutorlogin(),
                          ),
                        );
                      }
                    } else if (user == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => tutorlogin(),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                buttonstyle(
                  title: "I AM STUDENT",
                  color: Color(0xFF1215EE),
                  onpressed: () async {
                    if (user != null) {
                      var a = await FirebaseFirestore.instance
                          .collection('student')
                          .doc(user.email)
                          .get();
                      if (a.exists) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => courseScreen(),
                          ),
                        );
                      } else {
                        Toast.show("User is not registered as student", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.CENTER);
                      }
                    } else if (studentuser == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => studentlogin(),
                        ),
                      );
                    }
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => courseScreen(),
                    //   ),
                    // );
                  },
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

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }
}

class buttonstyle extends StatelessWidget {
  final String title;
  final Color color;
  final Function onpressed;
  const buttonstyle({
    Key key,
    this.title,
    this.color,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        padding: EdgeInsets.all(30),
        onPressed: onpressed,
        child: Text(
          title,
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
        color: color,
      ),
    );
  }
}
