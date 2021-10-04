import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function onPress;

  const PrimaryButton({this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 50,
        color: Color(0xFFEB1555),
      ),
    );
  }
}
