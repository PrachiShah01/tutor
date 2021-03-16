import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutor/pages/homescreen.dart';
import 'package:tutor/pages/welcomepage.dart';

class courseScreen extends StatelessWidget {
  final User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2829A6),
        actions: <Widget>[
          // IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => welcomePage(),
          //         ),
          //       );
          //     }),
          SizedBox(width: 260),
          // IconButton(
          //   icon: Icon(Icons.logout),
          //   onPressed: () async {
          //     await FirebaseAuth.instance.signOut();
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => welcomePage(),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Courses',
              style: TextStyle(
                fontSize: 30,
                color: Color(0xFF2829A6),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: <Widget>[
                courseButton(
                  image: Image.asset('assets/engineericon.png'),
                  text: 'Engineering',
                  onpressed: () {},
                ),
                SizedBox(width: 5),
                courseButton(
                  image: Image.asset('assets/commerce.png'),
                  text: 'Commerce',
                  onpressed: () {},
                ),
                SizedBox(width: 5),
                courseButton(
                  image: Image.asset('assets/mathsscience.png'),
                  text: 'Science',
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => homeScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                courseButton(
                  image: Image.asset('assets/engineericon.png'),
                  text: 'Engineering',
                  onpressed: () {},
                ),
                SizedBox(width: 5),
                courseButton(
                  image: Image.asset('assets/commerce.png'),
                  text: 'Commerce',
                  onpressed: () {},
                ),
                SizedBox(width: 5),
                courseButton(
                  image: Image.asset('assets/mathsscience.png'),
                  text: 'Science',
                  onpressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                courseButton(
                  image: Image.asset('assets/engineericon.png'),
                  text: 'Engineering',
                  onpressed: () {},
                ),
                SizedBox(width: 5),
                courseButton(
                  image: Image.asset('assets/commerce.png'),
                  text: 'Commerce',
                  onpressed: () {},
                ),
                SizedBox(width: 5),
                courseButton(
                  image: Image.asset('assets/mathsscience.png'),
                  text: 'Science',
                  onpressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                courseButton(
                  image: Image.asset('assets/engineericon.png'),
                  text: 'Engineering',
                  onpressed: () {},
                ),
                SizedBox(width: 5),
                courseButton(
                  image: Image.asset('assets/commerce.png'),
                  text: 'Management & Commerce',
                  onpressed: () {},
                ),
                SizedBox(width: 5),
                courseButton(
                  image: Image.asset('assets/mathsscience.png'),
                  text: 'Mathematics & Science',
                  onpressed: () {},
                ),
              ],
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
                          Text('Visit Profile'),
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

class courseButton extends StatelessWidget {
  courseButton({this.image, this.text, this.onpressed});
  final Image image;
  final String text;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RaisedButton(
        onPressed: onpressed,
        color: Color(0xFFFFFFFF),
        child: Column(
          children: [
            image,
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
      ),
    );
  }
}
