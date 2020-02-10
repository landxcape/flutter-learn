import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var testDirection;
  String baseUrl = 'http://192.168.4.1/sumo_commands';

  JoystickDirectionCallback onDirectionChanged(
      double degrees, double throttle) {
    // print('degrees :${degrees.toStringAsFixed(2)}, throttle:${throttle.toStringAsFixed(2)}');

    _sumoCommandGetRequest(
        degrees.toStringAsFixed(0), throttle.toStringAsFixed(2));
  }

  _sumoCommandGetRequest(String degrees, String throttle) async {
    String url = '$baseUrl?degrees=$degrees&throttle=$throttle';
    // print('$url');
    Response response = await get(url);

    // sample info available in response
    int statusCode = response.statusCode;
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;
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
            size: 300,
            interval: Duration(milliseconds: 20),
            backgroundColor: Colors.black54,
            innerCircleColor: Colors.black87,
            onDirectionChanged: onDirectionChanged,
          ),
        ),
      ),
    );
  }
}
