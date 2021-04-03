import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:tutor/pages/bio.dart';
import 'package:tutor/pages/tutorhome.dart';
import 'package:tutor/pages/tutorsignup.dart';
import 'forgot.dart';

class tutorlogin extends StatefulWidget {
  @override
  _tutorloginState createState() => _tutorloginState();
}

class _tutorloginState extends State<tutorlogin> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String email, password, input;
  bool _secureTextPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/head.png',
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'TEACHER Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2829A6),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                    focusColor: Color(0xFF000000),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter Email",
                    prefixIcon: Icon(Icons.email),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49.0),
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49.0),
                      borderSide: BorderSide(
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49.0),
                      borderSide: BorderSide(
                        width: 1.5,
                      ),
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter Email';
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+[a-z]")
                        .hasMatch(value)) {
                      return "Enter valid Email";
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    email = value;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextFormField(
                  obscureText: _secureTextPass,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                    focusColor: Color(0xFF000000),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Enter Password",
                    prefixIcon: IconButton(
                      icon: Icon(_secureTextPass
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _secureTextPass = !_secureTextPass;
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49.0),
                      borderSide: BorderSide(color: Colors.blue, width: 1.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49.0),
                      borderSide: BorderSide(
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49.0),
                      borderSide: BorderSide(
                        width: 1.5,
                      ),
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    password = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 150),
                child: GestureDetector(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => forgotpass(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xFF2829A6),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(49),
                child: FlatButton(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  onPressed: () async {
                    final formstate = formkey.currentState;
                    if (formstate.validate()) {
                      formstate.save();
                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithEmailAndPassword(
                                email: email, password: password);
                        var a = await FirebaseFirestore.instance
                            .collection('tutor')
                            .doc(email)
                            .get();
                        if (a.exists) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => tutorbio(),
                            ),
                          );
                        } else {
                          Toast.show(
                              "No user is registered as tutor with this email",
                              context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.CENTER);
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          Toast.show("No user found for that email", context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.CENTER);
                        } else if (e.code == 'wrong-password') {
                          Toast.show(
                              "wrong password for that email address", context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.CENTER);
                        }
                      }
                    }
                  },
                  color: Color(0xFF2829A6),
                  height: 50,
                  minWidth: 300,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Text(
                  //   'Don\'t have an account?',
                  //   style: TextStyle(
                  //     color: Color(0xFF2829A6),
                  //   ),
                  // ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => tutorsignup(),
                        ),
                      );
                    },
                    child: Text(
                      'Don\'t have an account? Signup',
                      style: TextStyle(
                        color: Color(0xFF2829A6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
