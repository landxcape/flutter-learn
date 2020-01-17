import 'package:flutter/material.dart';

import './row_values.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _config = [
    {
      'totalRows': '4',
      'loopTime': '6000',
      'commonCathode': 1,
    }
  ];
  var _rowContaints = [
    {
      'rows': [
        {
          'size': '4',
          'value': '1234',
        },
      ],
    },
    {
      'rows': [
        {
          'size': '6',
          'value': '567809',
        },
      ],
    },
    {
      'rows': [
        {
          'size': '4',
          'value': '9012',
        },
      ],
    },
    {
      'rows': [
        {
          'size': '4',
          'value': '1234',
        },
      ],
    },
    {
      'rows': [
        {
          'size': '4',
          'value': '1234',
        },
      ],
    },
    {
      'rows': [
        {
          'size': '6',
          'value': '567809',
        },
      ],
    },
    {
      'rows': [
        {
          'size': '4',
          'value': '9012',
        },
      ],
    },
    {
      'rows': [
        {
          'size': '4',
          'value': '1234',
        },
      ],
    },
    {
      'rows': [
        {
          'size': '4',
          'value': '9012',
        },
      ],
    },
    {
      'rows': [
        {
          'size': '4',
          'value': '1234',
        },
      ],
    },
  ];

  void _rowUpdate(int rowIndex, String key, String updatedValue) {
    _rowContaints[rowIndex]['rows'][0][key] = updatedValue;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Seven Segment App'),
        ),
        body: RowValues(
          config: _config,
          rowUpdate: _rowUpdate,
          rowContaints: _rowContaints,
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
