import 'package:flutter/material.dart';

void main() => runApp(WhatCanYouHear());

class WhatCanYouHear extends StatefulWidget {
  @override
  _WhatCanYouHearState createState() => _WhatCanYouHearState();
}

class _WhatCanYouHearState extends State<WhatCanYouHear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What can you hear?'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'What can you Hear?',
          ),
        ),
      ),
    );
  }
}
