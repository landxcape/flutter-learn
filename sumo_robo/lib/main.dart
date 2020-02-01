import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sumo Controller'),
        ),
        body: Container(
          child: JoystickView(
            backgroundColor: Colors.black54,
            innerCircleColor: Colors.black87,
          ),
        ),
      ),
    );
  }
}
