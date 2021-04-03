import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/pages/homescreen.dart';
import 'package:tutor/pages/rate.dart';

class detailInfoPage extends StatefulWidget {
  final DocumentSnapshot tutor;
  detailInfoPage({Key key, this.tutor}) : super(key: key);

  @override
  _detailInfoPageState createState() => _detailInfoPageState();
}

class _detailInfoPageState extends State<detailInfoPage> {
  final User studentuser = FirebaseAuth.instance.currentUser;
  bool state = true;
  Image checkImage() {
    if (widget.tutor['photourl'] == null) {
      return Image.network(
          'https://www.google.com/search?q=person+icon&tbm=isch&source=iu&ictx=1&fir=pg_JAleUZSVcvM%252C4-mZLK2ZaoO83M%252C_&vet=1&usg=AI4_-kRhK74LeEuB1txDM9-3AV3IuhHXhQ&sa=X&ved=2ahUKEwipj_enmLTvAhXZUn0KHUmBC1sQ9QF6BAgKEAE#imgrc=pg_JAleUZSVcvM');
    } else if (widget.tutor['photourl'] != null) {
      return Image.network(widget.tutor['photourl']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2829A6),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.grey,
              child: ClipOval(
                child: SizedBox(
                  width: 190,
                  height: 190,
                  child: (widget.tutor['photourl'] == null)
                      ? Image.asset('assets/teacher.png')
                      : Image.network(
                          widget.tutor['photourl'],
                        ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 450,
              width: 500,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Name: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              widget.tutor['username'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Academy Name: ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                (widget.tutor['academyname'].toString() == null)
                                    ? " "
                                    : widget.tutor['academyname'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Flexible(
                          child: Row(
                            children: [
                              Text(
                                'Email: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                widget.tutor['email'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Subject:  ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              (widget.tutor['language'].toString() == null)
                                  ? " "
                                  : widget.tutor['language'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Experience:  ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              (widget.tutor['experience'].toString() == null)
                                  ? " "
                                  : widget.tutor['experience'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Years',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Fees:  ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              (widget.tutor['fee'].toString() == null)
                                  ? " "
                                  : widget.tutor['fee'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'per Year',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Address:  ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              (widget.tutor['address'].toString() == null)
                                  ? " "
                                  : widget.tutor['address'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'City:  ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              (widget.tutor['city'].toString() == null)
                                  ? " "
                                  : widget.tutor['city'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              'Mobile number:  ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              (widget.tutor['mobileno'].toString() == null)
                                  ? " "
                                  : widget.tutor['mobileno'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ],
                        ),
                        RaisedButton(onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  rate(widget.tutor['email'].toString()),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
