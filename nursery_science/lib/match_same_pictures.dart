import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text('Match Same Pictures')),
      body: MatchTable(senseOrgans: senseOrgans),
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
  AudioCache _audioController = AudioCache();

  _MatchTableState({this.senseOrgans});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

  Widget _buildDraggableImages(organ) {
    double contentWidth = MediaQuery.of(context).size.width * 0.3;

    return Container(
      constraints: BoxConstraints(
        maxHeight: contentWidth,
        maxWidth: contentWidth,
      ),
      child: Draggable(
        onDragCompleted: () {},
        data: organ.toString(),
        child: Image.asset(
          senseOrgans[organ],
          fit: BoxFit.scaleDown,
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
          }
          // tried = true; // no second try
          tried = false; // multiple tries
        }
      },
    );
  }
}
