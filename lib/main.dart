import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  // void stopSound(int soundNumber) async {
  //   final player = AudioPlayer();
  //   await player.stop(); // Stop sound
  // }

  Expanded buildKey({
    required Color colName,
    required int soundNumber,
    required String buttonText,
  }) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: colName,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),

        onPressed: () {
          playSound(soundNumber);
        },
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Pomodoro time🍅🕒',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFFE57373),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(
                colName: Color(0xFFD7B49E),
                soundNumber: 1,
                buttonText: '🎹 5 minute piano break 🎧',
              ),
              buildKey(
                colName: Color(0xFFD0F0FF),
                soundNumber: 2,
                buttonText: '☂️ 10 min. rainstorm recovery 🌦️',
              ),
              SizedBox(
                height: 10.0,
                width: 180.0,
                child: Divider(color: Colors.white70),
              ),
              buildKey(
                colName: Color(0xFFFFD1DC),
                soundNumber: 3,
                buttonText: '🌼️ 20 min. focus time during spring 🌸',
              ),
              buildKey(
                colName: Color(0xFF3FE0D0),
                soundNumber: 4,
                buttonText: '⛵ 30 min. focus time at the sea 🐚',
              ),
              buildKey(
                colName: Color(0xFF005F73),
                soundNumber: 5,
                buttonText: '🌊 60 min. focus time near big waves ‍🏄',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
