import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';
import 'package:tutor/pages/tutorlogin.dart';

class tutorsignup extends StatefulWidget {
  @override
  _tutorsignupState createState() => _tutorsignupState();
}

class _tutorsignupState extends State<tutorsignup> {
  final firebaseUser = FirebaseAuth.instance.currentUser;
  String email, password, repassword, mobileno, username;
  bool _secureTextPass = true;
  bool _secureTextRepass = true;
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('tutor');
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0),
            child: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Image.asset('assets/head.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Signup as a TUTOR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Color(0xFF4547ED),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "username",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                          focusColor: Color(0xFF000000),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "full name",
                          prefixIcon: Icon(Icons.person),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(49.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5),
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
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          username = value;
                        },
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5),
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
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Email';
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+[a-z]")
                              .hasMatch(value)) {
                            return "Enter valid Email";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: TextFormField(
                        controller: _password,
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
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5),
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
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: TextFormField(
                        controller: _confirmpassword,
                        obscureText: _secureTextRepass,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                          focusColor: Color(0xFF000000),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "Re-Enter Password",
                          prefixIcon: IconButton(
                            icon: Icon(_secureTextRepass
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _secureTextRepass = !_secureTextRepass;
                              });
                            },
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(49.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5),
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
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter Password';
                          }
                          if (_password.text != _confirmpassword.text) {
                            return "Password doesn't match";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          repassword = value;
                        },
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Mobile Number",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                          focusColor: Color(0xFF000000),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: "Enter Mobile Number",
                          prefixIcon: Icon(Icons.call),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(49.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.5),
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
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Re-enter password';
                          }
                          return null;
                        },
                        onChanged: (String value) {
                          mobileno = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(49),
                      child: FlatButton(
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        onPressed: () async {
                          formkey.currentState.save();
                          if (formkey.currentState.validate()) {
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .createUserWithEmailAndPassword(
                                      email: email, password: password);
                              User user = FirebaseAuth.instance.currentUser;

                              if (!user.emailVerified) {
                                await user.sendEmailVerification();
                              }
                              if (user != null) {
                                collectionReference.doc(email).set(
                                  {
                                    'username': username,
                                    'email': email,
                                    'password': password,
                                    'mobileno': mobileno,
                                    'academyname': null,
                                    'address': null,
                                    'city': null,
                                    'teachingexperience': null,
                                    'language': null
                                  },
                                );
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => tutorlogin(),
                                ),
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                Toast.show("Password is too weak", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.CENTER);
                              } else if (e.code == 'email-already-in-use') {
                                Toast.show("Email already in used", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.CENTER);
                              }
                            } catch (e) {
                              print(e);
                            }
                            return "Successful";
                          }
                        },
                        color: Color(0xFF4547ED),
                        height: 50,
                        minWidth: 300,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Color(0xFF4547ED),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => tutorlogin(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xFF4547ED),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
