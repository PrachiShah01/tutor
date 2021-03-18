import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor/pages/homescreen.dart';

class detailInfoPage extends StatelessWidget {
  final DocumentSnapshot tutor;
  detailInfoPage({Key key, this.tutor}) : super(key: key);
  Image checkImage() {
    if (tutor['photourl'] == null) {
      return Image.network(
          'https://www.google.com/search?q=person+icon&tbm=isch&source=iu&ictx=1&fir=pg_JAleUZSVcvM%252C4-mZLK2ZaoO83M%252C_&vet=1&usg=AI4_-kRhK74LeEuB1txDM9-3AV3IuhHXhQ&sa=X&ved=2ahUKEwipj_enmLTvAhXZUn0KHUmBC1sQ9QF6BAgKEAE#imgrc=pg_JAleUZSVcvM');
    } else if (tutor['photourl'] != null) {
      return Image.network(tutor['photourl']);
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
                  child: (tutor['photourl'] == null)
                      ? Image.asset('assets/teacher.png')
                      : Image.network(
                          tutor['photourl'],
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
                              tutor['username'],
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
                                (tutor['academyname'].toString() == null)
                                    ? " "
                                    : tutor['academyname'].toString(),
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
                                tutor['email'],
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
                              (tutor['language'].toString() == null)
                                  ? " "
                                  : tutor['language'].toString(),
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
                              (tutor['experience'].toString() == null)
                                  ? " "
                                  : tutor['experience'].toString(),
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
                              'Address:  ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              (tutor['address'].toString() == null)
                                  ? " "
                                  : tutor['address'].toString(),
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
                              (tutor['city'].toString() == null)
                                  ? " "
                                  : tutor['city'].toString(),
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
                            // Text(
                            //   (tutor['mobileno'].toString() == null)
                            //       ? " "
                            //       : tutor['mobileno'].toString(),
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.w400, fontSize: 18),
                            // ),
                          ],
                        ),
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

// class detailinfocard extends StatelessWidget {
//   final IconData icon;
//   final String text;
//
//   const detailinfocard({Key key, @required this.tutor, this.icon, this.text})
//       : super(key: key);
//
//   final DocumentSnapshot tutor;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: Colors.black,
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Text(
//               text,
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//       elevation: 3,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     );
//   }
// }
