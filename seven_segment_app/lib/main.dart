import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './row_values.dart';
import './config_array.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _readConfig();
    _readRowValues();

    rowsContaints(_rowContaints, _configArray);

    super.initState();
  }

  List<Map<String, Object>> _configArray = [
    {
      'columns': '4',
      'totalRows': '15',
      'loopTime': '6000',
      'commonCathode': 1,
    }
  ];

  List<Map<String, List<Map<String, Object>>>> _rowContaints =
      new List<Map<String, List<Map<String, Object>>>>();

  _saveConfig(var _configArray) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('config_list', _configArray);
  }

  _readConfig() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _configArray = prefs.getStringList('config_list') ?? [];
  }

  _saveRowValues(var _rowValues) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('rowValues_list', _rowValues);
  }

  _readRowValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _rowContaints = prefs.getStringList('rowValues_list') ?? [];
  }

  void _rowUpdate(int rowIndex, String key, String updatedValue) {
    _rowContaints[rowIndex]['rows'][0][key] = updatedValue;
  }

  // List<Map<String, List<Map<String, Object>>>>
  void rowsContaints(var rowContaints, var configArray) {
    if (rowContaints.length < int.parse(configArray[0]['totalRows'])) {
      for (int i = rowContaints.length;
          i < int.parse(configArray[0]['totalRows']);
          i++) {
        setState(() {
          _rowContaints.addAll([
            {
              'rows': [
                {
                  'size': configArray[0]['columns'],
                  'value': '0000',
                },
              ],
            },
          ]);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Seven Segment App'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ConfigArray(
                  configArray: _configArray,
                ),
                RowValues(
                  configArray: _configArray,
                  rowUpdate: _rowUpdate,
                  rowContaints: _rowContaints,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          splashColor: Colors.indigo[200],
          onPressed: () {},
          label: Text('Upload'),
          icon: Icon(Icons.file_upload),
          backgroundColor: Colors.indigo,
        ),
      ),
    );
  }
}
