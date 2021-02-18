import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:toast/toast.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String email, password, input;
  bool _secureTextPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
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
                  height: 30,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: kButtonColor),
                ),
                SizedBox(
                  height: 20,
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
                      Navigator.pushNamed(context, '/forgot');
                    },
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: kButtonColor,
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
                      style: kButtonTextStyle,
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
                          Navigator.pushNamed(context, '/home');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            Toast.show("No user found for that email", context,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.CENTER);
                          } else if (e.code == 'wrong-password') {
                            Toast.show("wrong password for that email address",
                                context,
                                duration: Toast.LENGTH_SHORT,
                                gravity: Toast.CENTER);
                          }
                        }
                      }
                    },
                    color: kButtonColor,
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
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: kButtonColor,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          color: kButtonColor,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
