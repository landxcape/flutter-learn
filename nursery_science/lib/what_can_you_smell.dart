import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(WhatCanYouSmell());

class WhatCanYouSmell extends StatefulWidget {
  @override
  _WhatCanYouSmellState createState() => _WhatCanYouSmellState();
}

class _WhatCanYouSmellState extends State<WhatCanYouSmell> {
  static AudioCache player = AudioCache();
  String audioPath;

  List<Map<String, Object>> smellItems = [
    {'path': 'assets/images/touch_the_things/book.png', 'smell': false},
    {'path': 'assets/images/touch_the_things/pencil.png', 'smell': false},
    {'path': 'assets/images/touch_the_things/rose.png', 'smell': true},
    {'path': 'assets/images/touch_the_things/perfume.png', 'smell': true},
  ];

  smellCheck(int index) {
    setState(() {
      if (smellItems[index]['smell'] == true) {
        audioPath = 'sounds/correct_ding.mp3';
      } else {
        audioPath = 'sounds/wrong_buzzer.mp3';
      }
    });
    player.play(audioPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Touch what you can Smell.'),
      ),
      body: ListView.builder(
        itemCount: smellItems.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Image.asset(
              smellItems[index]['path'],
              fit: BoxFit.scaleDown,
            ),
            onTap: () {
              smellCheck(index);
            },
          );
        },
      ),
    );
  }
}
