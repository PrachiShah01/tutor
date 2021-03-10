import 'package:flutter/material.dart';

class emailField extends StatelessWidget {
  const emailField({
    Key key,
    @required this.emailTextEditingController,
  }) : super(key: key);

  final TextEditingController emailTextEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailTextEditingController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
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
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }
}
