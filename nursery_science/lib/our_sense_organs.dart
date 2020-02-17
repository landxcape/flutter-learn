import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class OurSenseOrgans extends StatefulWidget {
  @override
  _OurSenseOrgansState createState() => _OurSenseOrgansState();
}

class _OurSenseOrgansState extends State<OurSenseOrgans> {
  String onEyes = '';
  String onNose = '';
  String onHand = '';
  String onEars = '';
  String onTongue = '';
  final FlutterTts flutterTts = FlutterTts();

  List<Map<String, Object>> senseOrgans = [
    {'path': 'assets/images/sense_organs/eyes.png'},
    {'path': 'assets/images/sense_organs/nose.png'},
    {'path': 'assets/images/sense_organs/hand.png'},
    {'path': 'assets/images/sense_organs/ears.png'},
    {'path': 'assets/images/sense_organs/tongue.png'},
  ];

  speakUp(String text) async {
    setState(() {
      if (text == 'eyes') onEyes = 'Eyes\nEyes helps us See.';
    });
    await flutterTts.speak(text);
  }

  onTapEyes() {
    setState(() {
      onEyes = 'Eyes\nEyes helps us See.';
    });
    speakUp(onEyes);
  }

  onTapNose() {
    setState(() {
      onNose = 'Nose\nNose helps us Smell.';
    });
    speakUp(onNose);
  }

  onTapHand() {
    setState(() {
      onHand = 'Hand\nHand is how we Feel.';
    });
    speakUp(onHand);
  }

  onTapEars() {
    setState(() {
      onEars = 'Ears\nEars helps us Hear.';
    });
    speakUp(onEars);
  }

  onTapTongue() {
    setState(() {
      onTongue = 'Tongue\nTongue helps us Taste.';
    });
    speakUp(onTongue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Sense Organs!'),
      ),
      body: ListView.builder(
        itemCount: senseOrgans.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: GestureDetector(
              child: Image.asset(
                senseOrgans[index]['path'],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                fit: BoxFit.scaleDown,
              ),
              onTap: onTapEyes,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.pink,
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        },
      ),
    );
  }
}

// ...................................................................
//  Container(
//         margin: EdgeInsets.all(10.0),
//         child: ListView(
//           children: <Widget>[
//             Container(
//               child: GestureDetector(
//                 onTap: onTapEyes,
//                 child: Image.asset(
//                   'assets/images/sense_organs/eyes.png',
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.width,
//                   fit: BoxFit.scaleDown,
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.pink,
//                   width: 3.0,
//                 ),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//             ),
//             Text(
//               '$onEyes',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 30),
//             ),
//             Text(''),
//             Container(child:
//             GestureDetector(
//               onTap: onTapNose,
//               child: Image.asset(
//                 'assets/images/sense_organs/nose.png',
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.width,
//                 fit: BoxFit.scaleDown,
//               ),
//             ),
//             Text(
//               '$onNose',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 30),
//             ),
//             Text(''),
//             GestureDetector(
//               onTap: onTapHand,
//               child: Image.asset(
//                 'assets/images/sense_organs/hand.png',
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.width,
//                 fit: BoxFit.scaleDown,
//               ),
//             ),
//             Text(
//               '$onHand',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 30),
//             ),
//             Text(''),
//             GestureDetector(
//               onTap: onTapEars,
//               child: Image.asset(
//                 'assets/images/sense_organs/ears.png',
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.width,
//                 fit: BoxFit.scaleDown,
//               ),
//             ),
//             Text(
//               '$onEars',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 30),
//             ),
//             Text(''),
//             GestureDetector(
//               onTap: onTapTongue,
//               child: Image.asset(
//                 'assets/images/sense_organs/tongue.png',
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.width,
//                 fit: BoxFit.scaleDown,
//               ),
//             ),
//             Text(
//               '$onTongue',
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 30),
//             ),
//             Text(''),
//           ],
//         ),
//       ),
//     );
