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
  List<Map<String, String>> _configArray = [
    {
      'maxColumn': '4',
      'totalRows': '15',
      'totalLoopTime': '6000',
      'commonCathode': '1',
    }
  ];

  // List<Map<String, String>> _configArray = new List<Map<String, String>>();

  List<Map<String, List<Map<String, String>>>> _rowContaints =
      new List<Map<String, List<Map<String, String>>>>();

  @override
  void initState() {
    super.initState();
    setState(() {
      _readConfig();
      _readRowValues();

      rowsContaints();
    });
  }

  _saveConfig() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('maxColumn', _configArray[0]['maxColumn']);
    prefs.setString('totalRows', _configArray[0]['totalRows']);
    prefs.setString('totalLoopTime', _configArray[0]['totalLoopTime']);
    prefs.setString('commonCathode', _configArray[0]['commonCathode']);
  }

  _readConfig() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _configArray[0]['maxColumn'] = prefs.getString('maxColumn') ?? '4';
      _configArray[0]['totalRows'] = prefs.getString('totalRows') ?? '10';
      _configArray[0]['totalLoopTime'] =
          prefs.getString('totalLoopTime') ?? '6000';
      _configArray[0]['commonCathode'] =
          prefs.getString('commonCathode') ?? '1';
      // rowsContaints();
    });
  }

  _saveRowValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < _rowContaints.length; i++) {
      if (i < int.parse(_configArray[0]['totalRows'])) {
        prefs.setString(
            'rowValues_list_size_$i', _rowContaints[i]['rows'][0]['size']);
        prefs.setString(
            'rowValues_list_value_$i', _rowContaints[i]['rows'][0]['value']);
      } else {
        _rowContaints.removeAt(i);
      }
    }
  }

  _readRowValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      List<Map<String, List<Map<String, String>>>> rC;
      // _rowContaints.clear();
      for (int i = 0; i < int.parse(_configArray[0]['totalRows']); i++) {
        rC[i]['rows'][0]['size'] =
            prefs.getString('rowValues_list_size_$i') ?? '';
        rC[i]['rows'][0]['value'] =
            prefs.getString('rowValues_list_value_$i') ?? '';
        _rowContaints.addAll(rC);
      }
      // rowsContaints();
    });
  }

  void _configUpdate(int configIndex, String key, String updatedValue) {
    _configArray[configIndex][key] = updatedValue;
  }

  void _rowUpdate(int rowIndex, String key, String updatedValue) {
    _rowContaints[rowIndex]['rows'][0][key] = updatedValue;
  }

  void rowsContaints() {
    setState(() {
      if (_rowContaints.length < int.parse(_configArray[0]['totalRows'])) {
        for (int i = _rowContaints.length;
            i < int.parse(_configArray[0]['totalRows']);
            i++) {
          _rowContaints.addAll([
            {
              'rows': [
                {
                  'size': _configArray[0]['maxColumn'],
                  'value': '0000',
                },
              ],
            },
          ]);
        }
      }
    });
  }

  void btnUpload() {
    setState(() {
      _saveConfig();
      _saveRowValues();
      _readConfig();
      _readRowValues();
      rowsContaints();
    });
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
                  configUpdate: _configUpdate,
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
          onPressed: btnUpload,
          label: Text('Upload'),
          icon: Icon(Icons.file_upload),
          backgroundColor: Colors.indigo,
        ),
      ),
    );
  }
}
