import 'package:flutter/material.dart';

class menuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function ontap;

  const menuItem({Key key, this.icon, this.title, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.cyan,
              size: 25,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
