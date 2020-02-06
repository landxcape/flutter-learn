import 'package:flutter/material.dart';

void main() => runApp(WhatCanYouSee());

class WhatCanYouSee extends StatefulWidget {
  @override
  _WhatCanYouSeeState createState() => _WhatCanYouSeeState();
}

class _WhatCanYouSeeState extends State<WhatCanYouSee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What can you See?'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'What can you See?',
          ),
        ),
      ),
    );
  }
}
