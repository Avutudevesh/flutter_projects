import 'package:flash_chat/components/auth_text_field.dart';
import 'package:flash_chat/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const id = "registration";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool shouldShowSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: shouldShowSpinner,
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
                title: 'Register',
                buttonColor: Colors.blueAccent,
                onClick: () async {
                  setState(() {
                    shouldShowSpinner = true;
                  });
                  try {
                    var createdUser =
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                    if (createdUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    setState(() {
                      shouldShowSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                    setState(() {
                      shouldShowSpinner = false;
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
