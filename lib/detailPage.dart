import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'Data.dart';

class detailPage extends StatefulWidget {
  @override
  _detailPageState createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  List<Data> dataList = [];

  @override
  void initState() {
    super.initState();
    dataList.clear();
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child('tutor');
    databaseReference.once().then((DataSnapshot dataSnapshot) {
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;

      for (var key in keys) {
        Data data = new Data(
          values[key]["Email"],
          values[key]["Name"],
          values[key]["MobileNumber"],
        );
        dataList.add(data);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('tutor'),
        ),
        body: dataList.length == 0
            ? Center(child: Text('No data is available'))
            : ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (_, index) {
                  return CardUI(dataList[index].Email, dataList[index].Name,
                      dataList[index].MobileNumber);
                }),
      ),
    );
  }

  Widget CardUI(String Email, String Name, String MobileNumber) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(Name),
          SizedBox(
            height: 5,
          ),
          Text(Email),
          SizedBox(
            height: 5,
          ),
          Text(MobileNumber),
        ],
      ),
    );
  }
}
