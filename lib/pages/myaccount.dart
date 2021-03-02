import 'package:flutter/material.dart';
import '../blocnavigation_bloc/navigation_bloc.dart';

class myAccount extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "My Account",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
