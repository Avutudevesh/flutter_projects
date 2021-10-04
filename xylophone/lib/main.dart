import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Expanded(
            child: Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    playSound("assets/note1.wav");
                  },
                  child: Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    playSound("assets/note2.wav");
                  },
                  child: Container(
                    color: Colors.yellow,
                    width: 100,
                    height: 100,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    playSound("assets/note3.wav");
                  },
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 100,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    playSound("assets/note4.wav");
                  },
                  child: Container(
                    color: Colors.green,
                    width: 100,
                    height: 100,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    playSound("assets/note5.wav");
                  },
                  child: Container(
                    color: Colors.black,
                    width: 100,
                    height: 100,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    playSound("assets/note6.wav");
                  },
                  child: Container(
                    color: Colors.purple,
                    width: 100,
                    height: 100,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    playSound("assets/note7.wav");
                  },
                  child: Container(
                    color: Colors.pink,
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void playSound(String fileName) {
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio(fileName),
    );
    assetsAudioPlayer.play();
  }
}
