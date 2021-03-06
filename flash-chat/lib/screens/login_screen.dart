import 'package:flash_chat/components/auth_text_field.dart';
import 'package:flash_chat/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const id = "login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              AuthTextField(
                onTextChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                hint: "Enter your email",
              ),
              SizedBox(
                height: 8.0,
              ),
              AuthTextField(
                shouldObscureText: true,
                onTextChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                hint: "Enter your password",
              ),
              SizedBox(
                height: 24.0,
              ),
              PrimaryButton(
                buttonColor: Colors.lightBlueAccent,
                title: 'Log in',
                onClick: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    var user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                    setState(() {
                      showSpinner = false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
