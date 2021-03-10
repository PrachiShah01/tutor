import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutor/pages/welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class tutorinfo extends StatefulWidget {
  static const String idScreen = "tutorinfo";

  @override
  _tutorinfoState createState() => _tutorinfoState();
}

class _tutorinfoState extends State<tutorinfo> {
  final User tutoruser = FirebaseAuth.instance.currentUser;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('tutor');
  List subjectList = ['Physics', 'Mathematics', 'Biology', 'Chemistry'];
  String valueChoose;
  String name, academyname, address, city, language;
  int experience;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
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
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 70,
                child: Center(
                  child: Text(
                    'Tell us something more about you',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.black12,
                ),
              ),
              SizedBox(height: 20),
              Text(tutoruser.email),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        focusColor: Color(0xFF000000),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter Name",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      onChanged: (value) => name = value,
                    ),
                    SizedBox(height: 15),
                    TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusColor: Color(0xFF000000),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter academy name",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      onChanged: (value) => academyname = value,
                    ),
                    SizedBox(height: 15),
                    TextField(
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusColor: Color(0xFF000000),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter Address",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      onChanged: (value) => address = value,
                    ),
                    SizedBox(height: 15),
                    TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusColor: Color(0xFF000000),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter City",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      onChanged: (value) => city = value,
                    ),
                    SizedBox(height: 15),
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        focusColor: Color(0xFF000000),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Teaching experience in year",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        return experience.toString();
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.5),
                      ),
                      width: double.infinity,
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        hint: Center(
                          child: Text(
                            'Select Language',
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
                    SizedBox(
                      height: 15,
                    ),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20.0),
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        if (tutoruser != null) {
                          print(academyname);
                          collectionReference.doc(tutoruser.email).update(
                            {
                              'name': name,
                              'academyname': academyname,
                              'address': address,
                              'city': city,
                              'teachingexperience': experience,
                              'language': valueChoose,
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
