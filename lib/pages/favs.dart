import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/pages/courseScreen.dart';
import 'package:tutor/pages/homescreen.dart';
import 'package:tutor/pages/tutorhome.dart';
import 'package:tutor/pages/tutorinfo.dart';
import 'package:tutor/pages/welcomepage.dart';
import 'package:firebase_storage/firebase_storage.dart';

class myfavs extends StatefulWidget {
  @override
  _myfavsState createState() => _myfavsState();
}

class _myfavsState extends State<myfavs> {
  final User user = FirebaseAuth.instance.currentUser;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('student');
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('tutor');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF2829A6),
      appBar: AppBar(
        backgroundColor: Color(0xFF2829A6),
        actions: <Widget>[
          SizedBox(width: 260),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => welcomePage(),
                ),
              );
            },
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  //Container(),
                  FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('student')
                        .doc(user.email)
                        .get(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data = snapshot.data.data();
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: data['fav'].length,
                            itemBuilder: (context, index) {
                              var doc =
                                  collectionRef.doc(data['fav'][index]).get();
                              return Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        data['fav'][index],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection('student')
                                              .doc(user.email)
                                              .update({
                                            "fav": FieldValue.arrayRemove(
                                                [data['fav'][index]]),
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 10,
                              );
                            });
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: Container(
        color: Color(0xFF2829A6),
        width: 255.0,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                height: 165.0,
                width: 200,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('tutor')
                              .doc(user.email)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Text("Loading");
                            }
                            var document = snapshot.data;
                            return CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              child: ClipOval(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  // child: (document['photourl'] == null)
                                  //     ? Image.asset('assets/nextbutton.png')
                                  //     : Image.network(document['photourl']),
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Profile Name',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: "JosefinSans",
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey,
                thickness: 1.0,
              ),
              SizedBox(height: 12.0),
              ListTile(
                leading: Icon(Icons.list),
                title: Text('Course List', style: TextStyle(fontSize: 15)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => courseScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Tutor list', style: TextStyle(fontSize: 15)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => homeScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.save),
                title: Text('Saved tutors', style: TextStyle(fontSize: 15)),
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => myfavs(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Signout', style: TextStyle(fontSize: 15)),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => welcomePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
