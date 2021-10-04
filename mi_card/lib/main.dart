import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            ),
            Text(
              "Devesh Avutu",
              style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Software Engineer",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Card(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("+91-7022209295"),
                )),
            Card(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text(
                    "devesh14may@gmail.com",
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
