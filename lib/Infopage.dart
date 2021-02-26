// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// class infoPage extends StatefulWidget {
//   @override
//   _infoPageState createState() => _infoPageState();
// }
//
// class _infoPageState extends State<infoPage> {
//   Query _ref;
//   void initState() {
//     super.initState();
//     _ref = FirebaseDatabase.instance
//         .reference()
//         .child('HigherSecondary')
//         .child('Science')
//         .child('Biology')
//         .child('001');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
//             child: Row(
//               children: <Widget>[
//                 Icon(
//                   Icons.person,
//                   color: Colors.black54,
//                   size: 20,
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   tutor['Name'],
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
//             child: Row(
//               children: <Widget>[
//                 Icon(
//                   Icons.person,
//                   color: Colors.black54,
//                   size: 20,
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   tutor['Email'],
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
//             child: Row(
//               children: <Widget>[
//                 Icon(
//                   Icons.person,
//                   color: Colors.black54,
//                   size: 20,
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   tutor['MobileNumber'],
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
