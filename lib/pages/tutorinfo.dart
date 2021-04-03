import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:tutor/pages/tutorhome.dart';
import 'package:tutor/pages/welcomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'bio.dart';

class tutorinfo extends StatefulWidget {
  static const String idScreen = "tutorinfo";

  @override
  _tutorinfoState createState() => _tutorinfoState();
}

class _tutorinfoState extends State<tutorinfo> {
  final User tutoruser = FirebaseAuth.instance.currentUser;
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('tutor');
  List subjectList = [
    'Physics',
    'Mathematics',
    'Biology',
    'Chemistry',
    'English',
    'Gujarati',
    'Economics',
    'Statastics',
    'Computer',
    'History',
    'Geography',
    'Political Science',
    'Psychology',
    'Sociology',
    'Hindi',
    'Sanskrit'
  ];
  String valueChoose;
  String name, academyname, address, city, language, experience, fee, mobileno;
  File _image;
  final picker = ImagePicker();
  var pickedFile;
  String url;
  int selectRadio;
  String course;
  bool value = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future getImage(BuildContext context) async {
      pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        _image = File(pickedFile.path);
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);

      firebase_storage.Reference firebaseStorageRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('uploads/$fileName');
      firebase_storage.UploadTask uploadTask =
          firebaseStorageRef.putFile(_image);
      firebase_storage.TaskSnapshot taskSnapshot = await uploadTask;
      firebaseStorageRef.getDownloadURL().then((fileUrl) => url = fileUrl);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2829A6),
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
                    'EDIT YOUR PROFILE',
                    style: TextStyle(
                      color: Color(0xFF2829A6),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.black12,
                  child: ClipOval(
                    child: SizedBox(
                      width: 180,
                      height: 180,
                      child: _image != null ? Image.file(_image) : null,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.camera_alt),
                onPressed: () {
                  getImage(context);
                },
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      onChanged: (value) => name = value.toUpperCase(),
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
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      onChanged: (value) => academyname = value.toUpperCase(),
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
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
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
                      decoration: InputDecoration(
                        focusColor: Color(0xFF000000),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Teaching experience in year",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                      onChanged: (value) => experience = value,
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
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
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
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: selectRadio,
                          activeColor: Colors.blueAccent,
                          onChanged: (val) {
                            setSelectedRadio(val);
                            course = "Science";
                          },
                        ),
                        Text(
                          'Science',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: selectRadio,
                          activeColor: Colors.blueAccent,
                          onChanged: (val) {
                            setSelectedRadio(val);
                            course = "Commerce";
                          },
                        ),
                        Text(
                          'Commerce',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 3,
                          groupValue: selectRadio,
                          activeColor: Colors.blueAccent,
                          onChanged: (val) {
                            setSelectedRadio(val);
                            course = "Arts";
                          },
                        ),
                        Text(
                          'Arts',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
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
                            'Select Subject',
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
                    TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusColor: Color(0xFF000000),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter fees per year",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      onChanged: (value) => fee = value,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusColor: Color(0xFF000000),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: "Enter Mobile Number",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      onChanged: (value) => mobileno = value,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20.0),
                      color: Color(0xFF2829A6),
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
                        print(experience);
                        if (tutoruser != null) {
                          print(academyname);
                          uploadPic(context);
                          if (course == "Science") {
                            print(course);
                            FirebaseFirestore.instance
                                .collection(course)
                                .doc(tutoruser.email)
                                .set(
                              {
                                'username': name,
                                'academyname': academyname,
                                'address': address,
                                'city': city,
                                'experience': int.parse(experience),
                                'language': valueChoose,
                                'photourl': url,
                                'email': tutoruser.email,
                                'fee': int.parse(fee),
                                'mobileno': int.parse(mobileno)
                              },
                            );
                          } else if (course == "Commerce") {
                            print(course);
                            FirebaseFirestore.instance
                                .collection(course)
                                .doc(tutoruser.email)
                                .set(
                              {
                                'username': name,
                                'academyname': academyname,
                                'address': address,
                                'city': city,
                                'experience': int.parse(experience),
                                'language': valueChoose,
                                'photourl': url,
                                'email': tutoruser.email,
                                'fee': int.parse(fee),
                                'mobileno': int.parse(mobileno)
                              },
                            );
                          } else if (course == "Arts") {
                            print(course);
                            FirebaseFirestore.instance
                                .collection(course)
                                .doc(tutoruser.email)
                                .set(
                              {
                                'username': name,
                                'academyname': academyname,
                                'address': address,
                                'city': city,
                                'experience': int.parse(experience),
                                'language': valueChoose,
                                'photourl': url,
                                'email': tutoruser.email,
                                'fee': int.parse(fee),
                                'mobileno': int.parse(mobileno)
                              },
                            );
                          }
                          collectionReference.doc(tutoruser.email).update(
                            {
                              'username': name,
                              'academyname': academyname,
                              'address': address,
                              'city': city,
                              'experience': int.parse(experience),
                              'language': valueChoose,
                              'photourl': url,
                              'email': tutoruser.email,
                              'fee': int.parse(fee),
                              'mobileno': int.parse(mobileno)
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
                              .doc(tutoruser.email)
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
                                  child: (document['photourl'] == null)
                                      ? Image.asset('assets/teacher.png')
                                      : Image.network(document['photourl']),
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
                leading: Icon(Icons.home),
                title: Text('Home', style: TextStyle(fontSize: 15)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => tutorbio(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit', style: TextStyle(fontSize: 15)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => tutorinfo(),
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
