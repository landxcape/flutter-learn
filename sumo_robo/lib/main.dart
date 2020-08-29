import 'package:flutter/material.dart';
import 'package:control_pad/control_pad.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLights = false;
  bool isHorn = false;
  // var testDirection;
  double maxThrottle = 0.7;
  double degreesPast = 0;
  String baseUrl = 'http://192.168.4.1/sumo_commands';

  double _map(
      double x, double inMin, double inMax, double outMin, double outMax) {
    return (x - inMin) * (outMax - outMin) / (inMax - inMin) + outMin;
  }

  JoystickDirectionCallback _onDirectionChanged(
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

  _lightsRequest(String lights) async {
    String url = '$baseUrl?lights=$lights';
    print('$url');
    Response response = await get(url);
  }

  _hornRequest(String horn) async {
    String url = '$baseUrl?horn=$horn';
    print('$url');
    Response response = await get(url);
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
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        iconSize: 100.0,
                        icon: Icon(
                            isLights ? Icons.highlight_off : Icons.highlight),
                        onPressed: () {
                          setState(() {
                            isLights = !isLights;
                            print(isLights);
                          });
                          _lightsRequest(isLights ? 'ON' : 'OFF');
                        },
                      ),
                      GestureDetector(
                        child: IconButton(
                          iconSize: 100.0,
                          icon: Icon(Icons.volume_up),
                          color: Colors.indigoAccent,
                          onPressed: () {},
                        ),
                        onLongPressStart: (_) {
                          isHorn = true;
                          print(isHorn);
                          _hornRequest('ON');
                        },
                        onLongPressEnd: (_) {
                          isHorn = false;
                          print(isHorn);
                          _hornRequest('OFF');
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: JoystickView(
                    size: 300,
                    interval: Duration(milliseconds: 20),
                    backgroundColor: Colors.black54,
                    innerCircleColor: Colors.black87,
                    onDirectionChanged: _onDirectionChanged,
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
