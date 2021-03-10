import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutor/pages/welcomepage.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final User studentuser = FirebaseAuth.instance.currentUser;
  String subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF2829A6), actions: <Widget>[
        IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => welcomePage(),
                ),
              );
            }),
        SizedBox(width: 260),
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            // final SharedPreferences sharedPreference =
            //     await SharedPreferences.getInstance();
            // finalEmail = null;
            //print(finalEmail);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => welcomePage(),
              ),
            );
          },
        ),
      ]),
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('tutor')
              .where('language', isEqualTo: subject)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return Column(
              children: [
                SizedBox(height: 10),
                Container(
                  height: 100,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 160.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text(
                              'Physics',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              setState(() {
                                subject = "Physics";
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Color(0xFF2829A6),
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text(
                              'Chemistry',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {
                              setState(() {
                                subject = "Chemistry";
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Color(0xFF2829A6),
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text(
                              'Maths',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Color(0xFF2829A6),
                          ),
                        ),
                      ),
                      Container(
                        width: 160.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text(
                              'Biology',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            color: Color(0xFF2829A6),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 160.0,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: RaisedButton(
                      //       onPressed: () {},
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(30),
                      //       ),
                      //       color: Color(0xFF2829A6),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const Divider(
                  height: 30,
                  thickness: 2,
                ),
                Text(
                  'Select the best TUTOR for you',
                  style: TextStyle(
                    color: Color(0xFF2829A6),
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Divider(
                  height: 30,
                  thickness: 2,
                ),
                Expanded(
                  child: ListView(
                    children: snapshot.data.docs.map((document) {
                      return Card(
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child: CircleAvatar(
                                  radius: 30,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    document['email'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    document['academyname'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    document['name'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    document['mobileno'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        elevation: 30,
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
