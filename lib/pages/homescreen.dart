import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';
import 'package:tutor/pages/courseScreen.dart';
import 'package:tutor/pages/detailedinfopage.dart';
import 'package:tutor/pages/favs.dart';
import 'package:tutor/pages/welcomepage.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final User studentuser = FirebaseAuth.instance.currentUser;
  String subject, filter;
  bool changecolor = true;
  bool state = true;

  List subjectList = ['Experience', 'Fees'];
  String valueChoose;
  bool isSelected = true;

  Future getPosts() async {
    QuerySnapshot qn;
    if (subject == "Mathematics") {
      qn = await FirebaseFirestore.instance
          .collection('tutor')
          .where('language', isEqualTo: "Mathematics")
          .get();
    } else if (subject == "Chemistry") {
      qn = await FirebaseFirestore.instance
          .collection('tutor')
          .where('language', isEqualTo: "Chemistry")
          .get();
    }
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2829A6),
        actions: <Widget>[
          SizedBox(width: 260),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text(
                          'Physics',
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
                          style: TextStyle(color: Colors.white, fontSize: 18),
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
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          setState(() {
                            subject = "Mathematics";
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
                          'Biology',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          setState(() {
                            subject = "Biology";
                          });
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Color(0xFF2829A6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              height: 30,
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      width: 50,
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Center(
                          child: Text(
                            'Select Filter',
                          ),
                        ),
                        value: valueChoose,
                        items: subjectList
                            .map<DropdownMenuItem<String>>((valueItem) {
                          return DropdownMenuItem(
                            child: Text(valueItem),
                            value: valueItem,
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.filter_alt,
                    color: Color(0xFF2829A6),
                    size: 30,
                  ),
                )
              ],
            ),
            const Divider(
              height: 30,
              thickness: 2,
            ),
            Expanded(
              child: FutureBuilder(
                future: getPosts(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text("Loading"),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    detailInfoPage(tutor: snapshot.data[index]),
                              ),
                            );
                          },
                          child: Card(
                            margin: EdgeInsets.all(5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 90,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.black12,
                                          child: ClipOval(
                                            child: SizedBox(
                                              width: 60,
                                              height: 60,
                                              child: (snapshot.data[index]
                                                          ['photourl'] ==
                                                      null)
                                                  ? Image.asset(
                                                      'assets/teacher.png')
                                                  : Image.network(snapshot
                                                      .data[index]['photourl']),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          snapshot.data[index]['username'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                (snapshot.data[index]
                                                            ['academyname'] ==
                                                        null)
                                                    ? " "
                                                    : snapshot.data[index]
                                                        ['academyname'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20,
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          'Classes for:',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          (snapshot.data[index]['language']
                                                      .toString() ==
                                                  null)
                                              ? " "
                                              : snapshot.data[index]['language']
                                                  .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Experience:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: Text(
                                                (snapshot.data[index]
                                                                ['experience']
                                                            .toString() ==
                                                        null)
                                                    ? " "
                                                    : snapshot.data[index]
                                                            ['experience']
                                                        .toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Text('years'),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Rate:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Flexible(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    (snapshot.data[index]
                                                                    ['rate']
                                                                .toString() ==
                                                            null)
                                                        ? " "
                                                        : snapshot.data[index]
                                                                ['rate']
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text("/5"),
                                                  SizedBox(width: 100),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.save,
                                                      color: Colors.blue,
                                                    ),
                                                    onPressed: () {
                                                      FirebaseFirestore.instance
                                                          .collection('student')
                                                          .doc(
                                                              studentuser.email)
                                                          .update({
                                                        "fav": FieldValue
                                                            .arrayUnion([
                                                          snapshot.data[index][
                                                                  'academyname'] +
                                                              " - " +
                                                              snapshot.data[
                                                                      index]
                                                                  ['username']
                                                        ]),
                                                      });
                                                      Toast.show("Tutor saved",
                                                          context,
                                                          duration: Toast
                                                              .LENGTH_SHORT,
                                                          gravity:
                                                              Toast.CENTER);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            elevation: 30,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
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
                              .doc(studentuser.email)
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
