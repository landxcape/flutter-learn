import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'dart:math';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MatchPictures());

class MatchPictures extends StatefulWidget {
  @override
  _MatchPicturesState createState() => _MatchPicturesState();
}

class _MatchPicturesState extends State<MatchPictures> {
  Map senseOrgans = {
    'eyes': 'assets/images/sense_organs/eyes.png',
    'nose': 'assets/images/sense_organs/nose.png',
    'hand': 'assets/images/sense_organs/hand.png',
    'ears': 'assets/images/sense_organs/ears.png',
    'tongue': 'assets/images/sense_organs/tongue.png',
  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      // appBar: AppBar(title: Text('Match Same Pictures')),
      body: SafeArea(child: MatchTable(senseOrgans: senseOrgans)),
    );
  }
}

class MatchTable extends StatefulWidget {
  final Map senseOrgans;

  @override
  _MatchTableState createState() => _MatchTableState(senseOrgans: senseOrgans);

  MatchTable({this.senseOrgans});
}

class _MatchTableState extends State<MatchTable> {
  Map senseOrgans;
  Map<String, bool> score = {};
  int _maxLives = 3;
  AudioCache _audioController = AudioCache();

  _MatchTableState({this.senseOrgans});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Match ',
                  ),
                  TextSpan(
                    text: 'Same',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(
                    text: ' Pictures',
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      tileMode: TileMode.mirror,
                      colors: [
                        Colors.white,
                        Colors.pink,
                      ],
                    ),
                    border: Border(
                      right: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: ' :Score ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      tileMode: TileMode.mirror,
                      colors: [
                        Colors.pink,
                        Colors.white,
                      ],
                    ),
                    border: Border(
                      left: BorderSide(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: ' Lifes: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      LimitedBox(
                        maxWidth: 100.0,
                        maxHeight: 100.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _maxLives,
                          itemBuilder: (BuildContext context, int index) =>
                              Icon(Icons.favorite),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: SingleChildScrollView(
            child: LimitedBox(
              maxHeight: MediaQuery.of(context).size.height * (9.8 / 12.5),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: senseOrgans.keys
                            .map((organ) => _buildDraggableImages(organ))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: senseOrgans.keys
                            .map((organ) => _buildDragTarget(organ))
                            .toList()
                              ..shuffle(Random()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDraggableImages(organ) {
    double contentWidth = MediaQuery.of(context).size.width * 0.3;

    return Draggable(
      onDragCompleted: () {},
      data: organ.toString(),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: contentWidth,
          maxWidth: contentWidth,
        ),
        child: Image.asset(
          senseOrgans[organ],
          fit: BoxFit.scaleDown,
        ),
      ),
      feedback: Container(
        constraints: BoxConstraints(
          maxHeight: contentWidth,
          maxWidth: contentWidth,
        ),
        child: Image.asset(
          senseOrgans[organ],
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Widget _buildDragTarget(organ) {
    String correct = '';
    bool tried = false;
    double contentWidth = MediaQuery.of(context).size.width * 0.3;

    return DragTarget(
      builder: (BuildContext context, List<String> accepted, List rejected) {
        if (correct == 'true') {
          tried = true;
          return Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              maxHeight: contentWidth,
              maxWidth: contentWidth,
            ),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  senseOrgans[organ],
                  fit: BoxFit.scaleDown,
                ),
                Icon(
                  Icons.check,
                  size: 50.0,
                  color: Colors.green,
                ),
              ],
            ),
          );
        } else if (correct == 'false') {
          return Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              maxHeight: contentWidth,
              maxWidth: contentWidth,
            ),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  senseOrgans[organ],
                  fit: BoxFit.scaleDown,
                ),
                Icon(
                  Icons.clear,
                  size: 50.0,
                  color: Colors.red,
                ),
              ],
            ),
          );
        } else {
          return Container(
            constraints: BoxConstraints(
              maxHeight: contentWidth,
              maxWidth: contentWidth,
            ),
            child: Image.asset(
              senseOrgans[organ],
              fit: BoxFit.scaleDown,
            ),
            height: contentWidth,
            width: contentWidth,
          );
        }
      },
      onAccept: (String data) {
        if (!tried) {
          if (data == organ) {
            _audioController.play('sounds/correct_ding.mp3');
            correct = 'true';
          } else {
            _audioController.play('sounds/wrong_buzzer.mp3');
            correct = 'false';
            setState(() {
              _maxLives--;
            });
          }
          // tried = true; // no second try
          tried = false; // multiple tries
        }
      },
    );
  }
}
