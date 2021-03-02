import 'package:flutter/material.dart';
import '../blocnavigation_bloc/navigation_bloc.dart';

class myOrder extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "My order",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
