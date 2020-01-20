import 'package:flutter/material.dart';

class ConfigArray extends StatefulWidget {
  final List<Map<String, Object>> configArray;

  ConfigArray({@required this.configArray});

  @override
  _ConfigArrayState createState() =>
      _ConfigArrayState(configArray: configArray);
}

class _ConfigArrayState extends State<ConfigArray> {
  List<Map<String, Object>> configArray;

  final TextEditingController rowNumberController = new TextEditingController();
  final TextEditingController rowSizeController = new TextEditingController();

  _ConfigArrayState({this.configArray});

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text('Columns'),
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.end,
                    controller: rowNumberController,
                    maxLength: 2,
                    maxLengthEnforced: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Max Columns',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text('Rows'),
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.end,
                    controller: rowNumberController,
                    maxLength: 2,
                    maxLengthEnforced: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Total Rows',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text('Loop Time'),
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.end,
                    controller: rowNumberController,
                    maxLength: 4,
                    maxLengthEnforced: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Total Loop Time',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text('Common Cathode'),
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.end,
                    controller: rowNumberController,
                    maxLength: 1,
                    maxLengthEnforced: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '1 or 0',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
