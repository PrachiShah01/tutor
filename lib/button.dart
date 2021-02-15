import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gatewayPage extends StatefulWidget {
  @override
  _gatewayPageState createState() => _gatewayPageState();
}

class _gatewayPageState extends State<gatewayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                padding: EdgeInsets.all(20),
                onPressed: () {},
                child: Text(
                  'I AM TEACHER',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(49),
                ),
                elevation: 15,
                color: Colors.pinkAccent,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                padding: EdgeInsets.all(20),
                onPressed: () {
                  Navigator.pushNamed(context, '/main');
                },
                child: Text(
                  'I AM STUDENT',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(49),
                ),
                elevation: 15,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
