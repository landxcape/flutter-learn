import 'package:flutter/material.dart';

class OurSenseOrgans extends StatefulWidget {
  @override
  _OurSenseOrgansState createState() => _OurSenseOrgansState();
}

class _OurSenseOrgansState extends State<OurSenseOrgans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Sense Organs!'),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/sense_organs/eyes.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(''),
          GestureDetector(
            child: Image.asset(
              'assets/images/sense_organs/nose.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(''),
          GestureDetector(
            child: Image.asset(
              'assets/images/sense_organs/hand.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(''),
          GestureDetector(
            child: Image.asset(
              'assets/images/sense_organs/ears.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(''),
          GestureDetector(
            child: Image.asset(
              'assets/images/sense_organs/tongue.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(''),
        ],
      ),
    );
  }
}
