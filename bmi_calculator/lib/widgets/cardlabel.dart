import 'package:flutter/material.dart';

class CardLabel extends StatelessWidget {
  CardLabel({this.labelIcon, this.labelText});
  final IconData labelIcon;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          labelIcon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(
          labelText,
          style: TextStyle(fontSize: 18, color: Color(0xFF8D8E98)),
        )
      ],
    );
  }
}
