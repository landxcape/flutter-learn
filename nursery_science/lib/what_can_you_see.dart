import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(WhatCanYouSee());

class WhatCanYouSee extends StatefulWidget {
  @override
  _WhatCanYouSeeState createState() => _WhatCanYouSeeState();
}

class _WhatCanYouSeeState extends State<WhatCanYouSee> {
  static AudioCache player = AudioCache();
  String audioPath;

  List<Map<String, Object>> seeItems = [
    {'path': 'assets/images/touch_the_things/ball.png', 'see': true},
    {'path': 'assets/images/touch_the_things/air.png', 'see': false},
    {'path': 'assets/images/touch_the_things/home.png', 'see': true},
  ];

  seeCheck(int index) {
    setState(() {
      if (seeItems[index]['see'] == true) {
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
        title: Text('Touch what you can See.'),
      ),
      body: ListView.builder(
        itemCount: seeItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Image.asset(
                seeItems[index]['path'],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                fit: BoxFit.scaleDown,
              ),
              onTap: () {
                seeCheck(index);
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
