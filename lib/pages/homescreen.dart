import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class homeScreen extends StatelessWidget {
  String subject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('tutor').snapshots(),
          // .where('subject', isEqualTo: "Maths")
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
                              subject = "physics";
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
                                    document['name'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    document['mobileno'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    document['language'],
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
