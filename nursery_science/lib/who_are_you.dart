import 'package:flutter/material.dart';

class WhoAreYou extends StatefulWidget {
  @override
  _WhoAreYouState createState() => _WhoAreYouState();
}

class _WhoAreYouState extends State<WhoAreYou> {
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
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  'assets/images/boy.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/girl.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 'Boy',
                groupValue: 1,
                activeColor: Colors.pink,
                onChanged: (val) {
                  print("Radio $val");
                },
              ),
              Radio(
                value: 'Girl',
                groupValue: 1,
                activeColor: Colors.pink,
                onChanged: (val) {
                  print("Radio $val");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
