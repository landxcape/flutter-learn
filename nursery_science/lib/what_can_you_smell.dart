import 'package:flutter/material.dart';

void main() => runApp(WhatCanYouSmell());

class WhatCanYouSmell extends StatefulWidget {
  @override
  _WhatCanYouSmellState createState() => _WhatCanYouSmellState();
}

class _WhatCanYouSmellState extends State<WhatCanYouSmell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What can you Smell?'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'What can you Smell?',
          ),
        ),
      ),
    );
  }
}
