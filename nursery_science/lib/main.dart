import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      home: HomePage(),
      routes: <String, WidgetBuilder>{
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nursery Science'),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Student Name'),
              accountEmail: Text('studentemail@schoolmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.accents
                        : Colors.amber,
                child: Text('S'),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.accents
                          : Colors.amber,
                  child: Text('T'),
                ),
                CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.accents
                          : Colors.amber,
                  child: Text('U'),
                ),
              ],
            ),
            ListTile(
              title: Text('Who Are You?'),
              leading: Icon(Icons.people),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/whoareyou');
                // OR,
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => WhoAreYou()));
              },
            ),
            ListTile(
              title: Text('Our Sense Organs!'),
              leading: Icon(Icons.face),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/oursenseorgans');
              },
            ),
            ListTile(
              title: Text('What can you Smell?'),
              leading: Icon(Icons.face),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/whatcanyousmell');
              },
            ),
            ListTile(
              title: Text('What can you See?'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/whatcanyousee');
              },
            ),
            ListTile(
              title: Text('What can you Hear?'),
              leading: Icon(Icons.phone),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/whatcanyouhear');
              },
            ),
            ListTile(
              title: Text('What can you Taste?'),
              leading: Icon(Icons.fastfood),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/whatcanyoutaste');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Close'),
              leading: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
