import 'package:flutter/material.dart';

void main() => runApp(WhatCanYouTaste());

class WhatCanYouTaste extends StatefulWidget {
  @override
  _WhatCanYouTasteState createState() => _WhatCanYouTasteState();
}

class _WhatCanYouTasteState extends State<WhatCanYouTaste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What can you Taste?'),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            'What can you Taste?',
          ),
        ),
      ),
    );
  }
}
