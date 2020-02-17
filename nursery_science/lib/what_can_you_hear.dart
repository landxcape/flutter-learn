import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(WhatCanYouHear());

class WhatCanYouHear extends StatefulWidget {
  @override
  _WhatCanYouHearState createState() => _WhatCanYouHearState();
}

class _WhatCanYouHearState extends State<WhatCanYouHear> {
  static AudioCache player = AudioCache();
  String audioPath;

  List<Map<String, Object>> hearItems = [
    {'path': 'assets/images/touch_the_things/mango.png', 'hear': false},
    {'path': 'assets/images/touch_the_things/drum.png', 'hear': true},
    {'path': 'assets/images/touch_the_things/phone.png', 'hear': true},
  ];

  hearCheck(int index) {
    setState(() {
      if (hearItems[index]['hear'] == true) {
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
        title: Text('Touch what you can Hear.'),
      ),
      body: ListView.builder(
        itemCount: hearItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Image.asset(
                hearItems[index]['path'],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                fit: BoxFit.scaleDown,
              ),
              onTap: () {
                hearCheck(index);
              },
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.pink,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        },
      ),
    );
  }
}
