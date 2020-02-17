import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'homepage.dart';
import 'who_are_you.dart';
import 'our_sense_organs.dart';
import 'what_can_you_smell.dart';
import 'what_can_you_see.dart';
import 'what_can_you_hear.dart';
import 'what_can_you_taste.dart';

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
          primarySwatch: Colors.pink,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[50]
              : null),
      initialRoute: '/loginpage',
      routes: <String, WidgetBuilder>{
        "/loginpage": (BuildContext context) => LoginPage(),
        "/homepage": (BuildContext context) => HomePage(),
        "/whoareyou": (BuildContext context) => WhoAreYou(),
        "/oursenseorgans": (BuildContext context) => OurSenseOrgans(),
        "/whatcanyousmell": (BuildContext context) => WhatCanYouSmell(),
        "/whatcanyousee": (BuildContext context) => WhatCanYouSee(),
        "/whatcanyouhear": (BuildContext context) => WhatCanYouHear(),
        "/whatcanyoutaste": (BuildContext context) => WhatCanYouTaste(),
      },
    );
  }
}
