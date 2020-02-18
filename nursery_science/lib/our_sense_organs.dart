import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class OurSenseOrgans extends StatefulWidget {
  @override
  _OurSenseOrgansState createState() => _OurSenseOrgansState();
}

class _OurSenseOrgansState extends State<OurSenseOrgans> {
  String onEyes = '';
  String onNose = '';
  String onHand = '';
  String onEars = '';
  String onTongue = '';
  final FlutterTts flutterTts = FlutterTts();

  List<Map<String, Object>> senseOrgans = [
    {
      'path': 'assets/images/sense_organs/eyes.png',
      'text': 'Eyes\nEyes helps us See.',
      'blank': ''
    },
    {
      'path': 'assets/images/sense_organs/nose.png',
      'text': 'Nose\nNose helps us Smell.',
      'blank': ''
    },
    {
      'path': 'assets/images/sense_organs/hand.png',
      'text': 'Hand\nHand is how we Feel.',
      'blank': ''
    },
    {
      'path': 'assets/images/sense_organs/ears.png',
      'text': 'Ears\nEars helps us Hear.',
      'blank': ''
    },
    {
      'path': 'assets/images/sense_organs/tongue.png',
      'text': 'Tongue\nTongue helps us Taste.',
      'blank': ''
    },
  ];

  speakUp(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Sense Organs!'),
      ),
      body: ListView.builder(
        itemCount: senseOrgans.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: GestureDetector(
                    child: Image.asset(
                      senseOrgans[index]['path'],
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {
                      setState(() {
                        senseOrgans[index]['blank'] =
                            senseOrgans[index]['text'];

                        speakUp(senseOrgans[index]['text']);
                      });
                    },
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.pink,
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                Text(
                  senseOrgans[index]['blank'],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
                Container(height: 50.0),
              ],
            ),
          );
        },
      ),
    );
  }
}
