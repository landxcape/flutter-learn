import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var testDirection;

  JoystickDirectionCallback onDirectionChanged(
      double degrees, double distance) {
    print(
        "Degree :${degrees.toStringAsFixed(2)},distance:${distance.toStringAsFixed(2)}");
  }

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
            onDirectionChanged: onDirectionChanged,
          ),
        ),
      ),
    );
  }
}
