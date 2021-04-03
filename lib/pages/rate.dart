import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class rate extends StatefulWidget {
  String email;

  rate(String string);
  myFav(String string) {
    email = string;
  }

  @override
  _rateState createState() => _rateState(email);
}

class _rateState extends State<rate> {
  int rate = 5;
  String emailid;
  _rateState(String email) {
    emailid = email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    rate.toString(),
                  ),
                ],
              ),
            ),
            Container(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Color(0xFF2829A6),
                  inactiveTrackColor: Color(0xFF8D8E98),
                  thumbColor: Color(0xFF2829A6),
                  overlayColor: Color(0x292829A6),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                ),
                child: Slider(
                  value: rate.toDouble(),
                  min: 1,
                  max: 5,
                  onChanged: (double newValue) {
                    setState(() {
                      rate = newValue.round();
                    });
                  },
                ),
              ),
            ),
            RaisedButton(
              child: Text('SUBMIT'),
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('tutor')
                    .doc(emailid)
                    .update({
                  "rate": rate.toString(),
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
