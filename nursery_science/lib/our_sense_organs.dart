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

  speakUp(String text) async {
    await flutterTts.speak(text);
  }

  onTapEyes() {
    setState(() {
      onEyes = 'Eyes\nEyes helps us See.';
    });
    speakUp(onEyes);
  }

  onTapNose() {
    setState(() {
      onNose = 'Nose\nNose helps us Smell.';
    });
    speakUp(onNose);
  }

  onTapHand() {
    setState(() {
      onHand = 'Hand\nHand is how we Feel.';
    });
    speakUp(onHand);
  }

  onTapEars() {
    setState(() {
      onEars = 'Ears\nEars helps us Hear.';
    });
    speakUp(onEars);
  }

  onTapTongue() {
    setState(() {
      onTongue = 'Tongue\nTongue helps us Taste.';
    });
    speakUp(onTongue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Sense Organs!'),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: onTapEyes,
            child: Image.asset(
              'assets/images/sense_organs/eyes.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            '$onEyes',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          Text(''),
          GestureDetector(
            onTap: onTapNose,
            child: Image.asset(
              'assets/images/sense_organs/nose.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            '$onNose',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          Text(''),
          GestureDetector(
            onTap: onTapHand,
            child: Image.asset(
              'assets/images/sense_organs/hand.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            '$onHand',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          Text(''),
          GestureDetector(
            onTap: onTapEars,
            child: Image.asset(
              'assets/images/sense_organs/ears.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            '$onEars',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          Text(''),
          GestureDetector(
            onTap: onTapTongue,
            child: Image.asset(
              'assets/images/sense_organs/tongue.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            '$onTongue',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          Text(''),
        ],
      ),
    );
  }
}
