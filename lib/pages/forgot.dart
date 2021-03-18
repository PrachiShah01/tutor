import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class forgotpass extends StatefulWidget {
  @override
  _forgotpassState createState() => _forgotpassState();
}

class _forgotpassState extends State<forgotpass> {
  String email;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2829A6),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Text(
                  'Forgot Your Password?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color(0xFF2829A6),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text(
                    "Enter your registered email below to receive password related instruction",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
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
                    onChanged: (String value) {
                      email = value;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () async {
                await _firebaseAuth.sendPasswordResetEmail(email: email);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(49),
              ),
              color: Color(0xFF2829A6),
            ),
          ],
        ),
      ),
    );
  }
}
