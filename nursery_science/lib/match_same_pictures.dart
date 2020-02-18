import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MatchPictures());

class MatchPictures extends StatefulWidget {
  @override
  _MatchPicturesState createState() => _MatchPicturesState();
}

class _MatchPicturesState extends State<MatchPictures> {
  List<Map<String, Object>> senseOrgans = [
    {'organ': 'eyes', 'path': 'assets/images/sense_organs/eyes.png'},
    {'organ': 'nose', 'path': 'assets/images/sense_organs/nose.png'},
    {'organ': 'hand', 'path': 'assets/images/sense_organs/hand.png'},
    {'organ': 'ears', 'path': 'assets/images/sense_organs/ears.png'},
    {'organ': 'tongue', 'path': 'assets/images/sense_organs/tongue.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Match Same Pictures')),
      body: MatchTable(senseOrgans: senseOrgans),
    );
  }
}

class MatchTable extends StatefulWidget {
  final List<Map<String, Object>> senseOrgans;

  @override
  _MatchTableState createState() => _MatchTableState(senseOrgans: senseOrgans);

  MatchTable({this.senseOrgans});
}

class _MatchTableState extends State<MatchTable> {
  List<Map<String, Object>> senseOrgans;

  _MatchTableState({this.senseOrgans});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: senseOrgans.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.width * 0.1,
                    maxWidth: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Draggable(
                    child: Image.asset(
                      senseOrgans[index]['path'],
                      fit: BoxFit.scaleDown,
                    ),
                    feedback: Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.width * 0.1,
                        maxWidth: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Image.asset(
                        senseOrgans[index]['path'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: senseOrgans.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.width * 0.1,
                    maxWidth: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Draggable(
                    child: Image.asset(
                      senseOrgans[index]['path'],
                      fit: BoxFit.contain,
                    ),
                    feedback: Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.width * 0.1,
                        maxWidth: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Image.asset(
                        senseOrgans[index]['path'],
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
