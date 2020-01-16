import 'package:flutter/material.dart';

import './row_values.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _rowContaints = [
    {
      'rows': [
        {
          'size': 4,
          'value': 1234,
        },
      ],
    },
    {
      'rows': [
        {
          'size': 6,
          'value': 567809,
        },
      ],
    },
    {
      'rows': [
        {
          'size': 4,
          'value': 9012,
        },
      ],
    },
    {
      'rows': [
        {
          'size': 4,
          'value': 1234,
        },
      ],
    },
    {
      'rows': [
        {
          'size': 4,
          'value': 1234,
        },
      ],
    },
    {
      'rows': [
        {
          'size': 6,
          'value': 567809,
        },
      ],
    },
    {
      'rows': [
        {
          'size': 4,
          'value': 9012,
        },
      ],
    },
    {
      'rows': [
        {
          'size': 4,
          'value': 1234,
        },
      ],
    },
    {
      'rows': [
        {
          'size': 4,
          'value': 1234,
        },
      ],
    },
    {
      'rows': [
        {
          'size': 6,
          'value': 567809,
        },
      ],
    },
    {
      'rows': [
        {
          'size': 4,
          'value': 9012,
        },
      ],
    },
    {
      'rows': [
        {
          'size': 4,
          'value': 1234,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Seven Segment App'),
        ),
        body: RowValues(
          rowContaints: _rowContaints,
        ),
        floatingActionButton: FloatingActionButton.extended(
          splashColor: Colors.indigo[200],
          onPressed: () {
            // Add your onPressed code here!
          },
          label: Text('Upload'),
          icon: Icon(Icons.file_upload),
          backgroundColor: Colors.indigo,
        ),
      ),
    );
  }
}
