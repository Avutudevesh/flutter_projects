import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftRandomNumber = 1;
  int rightRandomNumber = 1;
  final random = new Random();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  leftRandomNumber = random.nextInt(6) + 1;
                  rightRandomNumber = random.nextInt(6) + 1;
                });
              },
              child: Image.asset('images/dice$leftRandomNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  leftRandomNumber = random.nextInt(6) + 1;
                  rightRandomNumber = random.nextInt(6) + 1;
                });
              },
              child: Image.asset('images/dice$rightRandomNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
