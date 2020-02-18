import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(Homepage());

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[50]
              : null),
      home: HomePage(),
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
                Navigator.of(context).popAndPushNamed('/whoareyou');
                // OR,
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => WhoAreYou()));
              },
            ),
            ListTile(
              title: Text('Our Sense Organs!'),
              leading: Icon(Icons.face),
              onTap: () {
                Navigator.of(context).popAndPushNamed('/oursenseorgans');
              },
            ),
            ListTile(
              title: Text('What can you Smell?'),
              leading: Icon(Icons.face),
              onTap: () {
                Navigator.of(context).popAndPushNamed('/whatcanyousmell');
              },
            ),
            ListTile(
              title: Text('What can you See?'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).popAndPushNamed('/whatcanyousee');
              },
            ),
            ListTile(
              title: Text('What can you Hear?'),
              leading: Icon(Icons.phone),
              onTap: () {
                Navigator.of(context).popAndPushNamed('/whatcanyouhear');
              },
            ),
            ListTile(
              title: Text('What can you Taste?'),
              leading: Icon(Icons.fastfood),
              onTap: () {
                Navigator.of(context).popAndPushNamed('/whatcanyoutaste');
              },
            ),
            ListTile(
              title: Text('Match Same Pictures'),
              leading: Icon(Icons.picture_in_picture),
              onTap: () {
                Navigator.of(context).popAndPushNamed('/matchpictures');
              },
            ),
            Divider(),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/loginpage');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          child: Text(
            'HomePage',
          ),
        ),
      ),
    );
  }
}
