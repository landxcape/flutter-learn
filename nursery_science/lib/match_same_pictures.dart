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

  List<Map<String, String>> matchTest = [
    {
      'eyes': 'assets/images/sense_organs/eyes.png',
      'nose': 'assets/images/sense_organs/nose.png',
      'hand': 'assets/images/sense_organs/hand.png',
      'ears': 'assets/images/sense_organs/ears.png',
      'tongue': 'assets/images/sense_organs/tongue.png',
    },
    {
      'eyes': 'Eyes',
      'nose': 'Nose',
      'hand': 'Hand',
      'ears': 'Ears',
      'tongue': 'Tongue',
    }
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      // appBar: AppBar(title: Text('Match Same Pictures')),
      body: SafeArea(
          child: MatchTable(
        senseOrgans: senseOrgans,
        matchTest: matchTest,
      )),
    );
  }
}

class MatchTable extends StatefulWidget {
  final Map senseOrgans;
  final List<Map<String, String>> matchTest;

  @override
  _MatchTableState createState() =>
      _MatchTableState(senseOrgans: senseOrgans, matchTest: matchTest);

  MatchTable({this.senseOrgans, this.matchTest});
}

class _MatchTableState extends State<MatchTable> {
  Map senseOrgans;
  List<Map<String, String>> matchTest;

  static int _maxLifes = 3;
  int randomShuffle = 0;
  int _score = 0;
  int _remainingLifes = _maxLifes;
  int _level = 0;

  Map<String, String> _scoreOrgans = {};
  Random random = new Random();
  AudioCache _audioController = AudioCache();

  int _getScore() {
    int score = 0;
    _scoreOrgans.values.forEach((value) {
      if (value == 'correct') score++;
    });
    return score;
  }

  _MatchTableState({this.senseOrgans, this.matchTest});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: _buildScoreLifes(),
        ),
        Expanded(
          flex: 9,
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
                            .map((item) => _buildDraggables(item))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        // key: ValueKey(1),
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: matchTest[_level]
                            .keys
                            .map((target) => _buildDragTargets(target))
                            .toList()
                              ..shuffle(Random(randomShuffle)),
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

  Widget _buildScoreLifes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 3,
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
        Flexible(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                tileMode: TileMode.mirror,
                colors: [
                  Colors.white,
                  Colors.pink,
                  Colors.white,
                ],
              ),
            ),
            child: RichText(
              text: TextSpan(
                  text: 'Level ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${_level + 1}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ]),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
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
                      text: '$_score :Score ',
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
                flex: 1,
                child: Container(
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
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            textAlign: TextAlign.center,
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
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: _remainingLifes > 0
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: _remainingLifes,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        Icon(Icons.favorite),
                              )
                            : Container(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            child: Icon(Icons.refresh),
                            onTap: () {
                              setState(() {
                                _scoreOrgans.clear();
                                _remainingLifes = _maxLifes;
                                _score = 0;
                                _level = 0;
                                randomShuffle = random.nextInt(100);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDraggables(item) {
    double contentWidth = MediaQuery.of(context).size.width * 0.3;

    return Draggable(
      onDragCompleted: () {},
      data: item.toString(),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: contentWidth / 2,
          maxWidth: contentWidth,
        ),
        child: Image.asset(
          senseOrgans[item],
          fit: BoxFit.scaleDown,
        ),
      ),
      feedback: Container(
        constraints: BoxConstraints(
          maxHeight: contentWidth / 2,
          maxWidth: contentWidth,
        ),
        child: Image.asset(
          senseOrgans[item],
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Widget _buildTargetContaints(target, _level) {
    if (_level == 0) {
      return Image.asset(
        matchTest[0][target],
        fit: BoxFit.scaleDown,
      );
    } else if (_level == 1) {
      return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: matchTest[1][target],
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20.0,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildDragTargets(target) {
    bool tried = false;
    double contentWidth = MediaQuery.of(context).size.width * 0.3;

    return DragTarget(
      builder: (BuildContext context, List<String> accepted, List rejected) {
        if (_scoreOrgans[target] == 'correct') {
          tried = true;
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.pink,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            constraints: BoxConstraints(
              maxHeight: contentWidth / 2,
              maxWidth: contentWidth,
            ),
            child: Stack(
              children: <Widget>[
                _buildTargetContaints(target, _level),
                Icon(
                  Icons.check,
                  size: 50.0,
                  color: Colors.green,
                ),
              ],
            ),
          );
        } else if (_scoreOrgans[target] == 'wrong') {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.pink,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            constraints: BoxConstraints(
              maxHeight: contentWidth / 2,
              maxWidth: contentWidth,
            ),
            child: Stack(
              children: <Widget>[
                _buildTargetContaints(target, _level),
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
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.pink,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            constraints: BoxConstraints(
              maxHeight: contentWidth / 2,
              maxWidth: contentWidth,
            ),
            child: _buildTargetContaints(target, _level),
            height: contentWidth,
            width: contentWidth,
          );
        }
      },
      onAccept: (String data) {
        if (!tried) {
          if (data == target) {
            _audioController.play('sounds/correct_ding.mp3');
            _scoreOrgans[target] = 'correct';
            setState(() {
              _score++;
              if (_getScore() >= matchTest[_level].length) {
                _level++;
                _scoreOrgans.clear();
                randomShuffle = random.nextInt(100);
                if (_level < matchTest.length)
                  _showDialog('You Win!!');
                else {
                  _showDialog(
                      'Congratulations!!\n\nYou Won!!!\nScore: $_score\nLifes Left: $_remainingLifes');
                  _level = 0;
                  _score = 0;
                  _remainingLifes = _maxLifes;
                }
              }
            });
          } else {
            _audioController.play('sounds/wrong_buzzer.mp3');
            _scoreOrgans[target] = 'wrong';
            setState(() {
              _remainingLifes--;
              if (_score > 0) _score--;

              if (_remainingLifes <= 0) {
                _score = 0;
                _level = 0;
                _remainingLifes = _maxLifes;
                _showDialog('You Lose!!');
              }
            });
          }
          // tried = true; // no second try
          tried = false; // multiple tries
        }
      },
    );
  }

  void _showDialog(String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: title,
              style: TextStyle(
                color: Colors.red,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                setState(() {
                  _scoreOrgans.clear();
                  // randomShuffle = random.nextInt(100);
                  Navigator.pop(context);
                });
              },
              child: Text('Next'),
            ),
          ],
        );
      },
    );
  }
}
