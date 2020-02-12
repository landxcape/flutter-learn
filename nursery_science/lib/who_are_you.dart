import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WhoAreYou extends StatefulWidget {
  @override
  _WhoAreYouState createState() => _WhoAreYouState();
}

class _WhoAreYouState extends State<WhoAreYou> {
  String gender = '';

  final FlutterTts flutterTts = FlutterTts();

  onImageTap(String gender) {
    setState(() {
      this.gender = '$gender';
    });
  }

  speakUp(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Who Are You?'),
      ),
      body: ListView(
        children: <Widget>[
          Text(
            'Who Are You?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0),
          ),
          Text('', textScaleFactor: 3.0),
          Text(
            'I am a $gender!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30.0),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('boy');
                    onImageTap('Boy');
                    speakUp('I am a $gender');
                  },
                  child: Image.asset(
                    'assets/images/gender/boy.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('girl');
                    onImageTap('Girl');
                    speakUp('I am a $gender');
                  },
                  child: Image.asset(
                    'assets/images/gender/girl.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Radio(
                value: 'Boy',
                groupValue: gender,
                onChanged: null,
              ),
              Radio(
                value: 'Girl',
                groupValue: gender,
                onChanged: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
