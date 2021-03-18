import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tutor/pages/courseScreen.dart';
import 'package:tutor/pages/detailedinfopage.dart';
import 'package:tutor/pages/welcomepage.dart';

class artsScreen extends StatefulWidget {
  @override
  _artsScreenState createState() => _artsScreenState();
}

class _artsScreenState extends State<artsScreen> {
  final User studentuser = FirebaseAuth.instance.currentUser;
  String subject, filter;

  Stream<QuerySnapshot> st =
      FirebaseFirestore.instance.collection('Arts').snapshots();
  List filterlist = ['Experience', 'Fees'];
  List citylist = ['navsari', 'surat'];
  String filterChoose;
  String cityChoose;
  bool isSelected = true;

  Future getPosts() async {
    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection('Arts').get();
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
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text(
                          'History',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          setState(() {
                            subject = "History";

                            st = FirebaseFirestore.instance
                                .collection('Arts')
                                .where('language', isEqualTo: subject)
                                .snapshots();
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
                          'Geography',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          setState(() {
                            subject = "Geography";

                            st = FirebaseFirestore.instance
                                .collection('Arts')
                                .where('language', isEqualTo: subject)
                                .snapshots();
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
                          'Political Science',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          setState(() {
                            subject = "Political Science";

                            st = FirebaseFirestore.instance
                                .collection('Arts')
                                .where('language', isEqualTo: subject)
                                .snapshots();
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
                          'Psychology',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          setState(() {
                            subject = "Psychology";

                            st = FirebaseFirestore.instance
                                .collection('Arts')
                                .where('language', isEqualTo: subject)
                                .snapshots();
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
                          'Sociology',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          setState(() {
                            subject = "Sociology";

                            st = FirebaseFirestore.instance
                                .collection('Arts')
                                .where('language', isEqualTo: subject)
                                .snapshots();
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
                          'English',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          setState(() {
                            subject = "English";

                            st = FirebaseFirestore.instance
                                .collection('Arts')
                                .where('language', isEqualTo: subject)
                                .snapshots();
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
                          'Hindi',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          setState(() {
                            subject = "Hindi";

                            st = FirebaseFirestore.instance
                                .collection('Arts')
                                .where('language', isEqualTo: subject)
                                .snapshots();
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
                          'Sanskrit',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        onPressed: () {
                          setState(() {
                            subject = "Sanskrit";

                            st = FirebaseFirestore.instance
                                .collection('Arts')
                                .where('language', isEqualTo: subject)
                                .snapshots();
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
                Expanded(
                  child: Container(
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
                          value: filterChoose,
                          items: filterlist
                              .map<DropdownMenuItem<String>>((valueItem) {
                            return DropdownMenuItem(
                              child: Text(valueItem),
                              value: valueItem,
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              filterChoose = newValue;

                              st = FirebaseFirestore.instance
                                  .collection('Commerce')
                                  .orderBy('experience', descending: true)
                                  .snapshots();
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
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
                              'Select City',
                            ),
                          ),
                          value: cityChoose,
                          items: citylist
                              .map<DropdownMenuItem<String>>((valueItem) {
                            return DropdownMenuItem(
                              child: Text(valueItem),
                              value: valueItem,
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              cityChoose = newValue;
                              st = FirebaseFirestore.instance
                                  .collection('Science')
                                  .where('city', isEqualTo: cityChoose)
                                  .snapshots();
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 30,
              thickness: 2,
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: st,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  return ListView(
                    children: snapshot.data.docs.map((document) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      detailInfoPage(tutor: document)));
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
                                            child:
                                                (document['photourl'] == null)
                                                    ? Image.asset(
                                                        'assets/teacher.png')
                                                    : Image.network(
                                                        document['photourl']),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        document['username'],
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
                                              (document['academyname'] == null)
                                                  ? " "
                                                  : document['academyname'],
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
                                        (document['language'].toString() ==
                                                null)
                                            ? " "
                                            : document['language'].toString(),
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
                                              (document['experience']
                                                          .toString() ==
                                                      null)
                                                  ? " "
                                                  : document['experience']
                                                      .toString(),
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text('years'),
                                          IconButton(
                                            icon: Icon(Icons.bookmark_border),
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection('student')
                                                  .doc(studentuser.email)
                                                  .update({
                                                "fav": FieldValue.arrayUnion(
                                                    [document.id]),
                                              });
                                            },
                                          )
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
                    }).toList(),
                  );
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
                                  child: Image.asset('assets/student.png'),
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
              // ListTile(
              //   leading: Icon(Icons.person),
              //   title: Text('Tutor list', style: TextStyle(fontSize: 15)),
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => courseScreen(),
              //       ),
              //     );
              //   },
              // ),
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
