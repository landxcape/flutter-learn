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
  double degreesPast = 0;
  String baseUrl = 'http://192.168.4.1/sumo_commands';
  double maxThrottle = 0.7;

  double _map(
      double x, double inMin, double inMax, double outMin, double outMax) {
    return (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
  }

  JoystickDirectionCallback onDirectionChanged(
      double degrees, double throttle) {
    // print('degrees :${degrees.toStringAsFixed(2)}, throttle:${throttle.toStringAsFixed(2)}');

    throttle = _map(throttle, 0, 1, 0, maxThrottle);

    _sumoCommandGetRequest(
        degrees.toStringAsFixed(0), throttle.toStringAsFixed(2));
    degreesPast = degrees;
  }

  _sumoCommandGetRequest(String degrees, String throttle) async {
    String url = '$baseUrl?degrees=$degrees&throttle=$throttle';
    print('$url');
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
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Slider(
                    value: maxThrottle,
                    min: 0,
                    max: 1,
                    label: 'Max Throttle',
                    onChanged: (double newValue) {
                      setState(() {
                        maxThrottle = newValue;
                      });
                      print(maxThrottle);
                    },
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: JoystickView(
                    size: 300,
                    interval: Duration(milliseconds: 20),
                    backgroundColor: Colors.black54,
                    innerCircleColor: Colors.black87,
                    onDirectionChanged: onDirectionChanged,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
