import 'package:bmicalculator/widgets/homecard.dart';
import 'package:bmicalculator/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String bmiValue;
  final String result;
  final String interpretation;

  const ResultsPage({this.bmiValue, this.result, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("BMI Calculator")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Your Results",
                  style: TextStyle(fontSize: 30),
                )),
            Expanded(
              flex: 5,
              child: HomeCard(
                backgroundColor: Color(0xFF1D1E33),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      result,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bmiValue,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),
            PrimaryButton(
              title: "Re-Calculate",
              onPress: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
