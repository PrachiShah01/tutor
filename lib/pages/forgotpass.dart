import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class forgotPass extends StatefulWidget {
  @override
  _forgotPassState createState() => _forgotPassState();
}

class _forgotPassState extends State<forgotPass> {
  String email;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                onChanged: (String value) {
                  email = value;
                },
              ),
            ),
            FlatButton(
              onPressed: () async {
                await _firebaseAuth.sendPasswordResetEmail(email: email);
              },
              child: Text(
                'Reset Password',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
