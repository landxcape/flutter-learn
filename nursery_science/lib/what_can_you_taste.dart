import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(WhatCanYouTaste());

class WhatCanYouTaste extends StatefulWidget {
  @override
  _WhatCanYouTasteState createState() => _WhatCanYouTasteState();
}

class _WhatCanYouTasteState extends State<WhatCanYouTaste> {
  static AudioCache player = AudioCache();
  String audioPath;

  List<Map<String, Object>> tasteItems = [
    {'path': 'assets/images/touch_the_things/ice_cream.png', 'taste': true},
    {'path': 'assets/images/touch_the_things/juice.png', 'taste': true},
    {'path': 'assets/images/touch_the_things/box_empty.png', 'taste': false},
  ];

  tasteCheck(int index) {
    setState(() {
      if (tasteItems[index]['taste'] == true) {
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
        title: Text('Touch what you can Taste.'),
      ),
      body: ListView.builder(
        itemCount: tasteItems.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Image.asset(
              tasteItems[index]['path'],
              fit: BoxFit.scaleDown,
            ),
            onTap: () {
              tasteCheck(index);
            },
          );
        },
      ),
    );
  }
}
