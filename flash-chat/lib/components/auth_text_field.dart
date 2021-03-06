import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {@required this.hint,
      @required this.onTextChanged,
      this.shouldObscureText});

  final String hint;
  final Function onTextChanged;
  final bool shouldObscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: shouldObscureText ?? false,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black),
      onChanged: (value) {
        onTextChanged(value);
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
