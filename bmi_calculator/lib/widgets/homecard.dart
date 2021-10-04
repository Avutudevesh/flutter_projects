import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({this.backgroundColor, this.child, this.onPress});

  final Color backgroundColor;
  final Widget child;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: this.child,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
