import 'package:flutter/material.dart';

class WhoAreYou extends StatefulWidget {
  @override
  _WhoAreYouState createState() => _WhoAreYouState();
}

class _WhoAreYouState extends State<WhoAreYou> {
  String gender = '';

  onImageTap(String gender) {
    setState(() {
      this.gender = '$gender!!';
    });
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
            textScaleFactor: 2.0,
          ),
          Text('', textScaleFactor: 3.0),
          Text(
            'I am a $gender',
            textAlign: TextAlign.center,
            textScaleFactor: 2.0,
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
                  },
                  child: Image.asset(
                    'assets/images/boy.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print('girl');
                    onImageTap('Girl');
                  },
                  child: Image.asset(
                    'assets/images/girl.png',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
