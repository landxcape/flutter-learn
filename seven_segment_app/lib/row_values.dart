import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './row_value.dart';

class RowValues extends StatefulWidget {
  final List<Map<String, String>> configArray;
  final List<Map<String, List<Map<String, String>>>> rowContaints;
  final Function rowUpdate;

  RowValues({
    @required this.configArray,
    @required this.rowContaints,
    @required this.rowUpdate,
  });

  @override
  _RowValuesState createState() => _RowValuesState(
        configArray: configArray,
        rowContaints: rowContaints,
        rowUpdate: rowUpdate,
      );
}

class _RowValuesState extends State<RowValues> {
  List<Map<String, String>> configArray;
  List<Map<String, List<Map<String, String>>>> rowContaints;
  final Function rowUpdate;

  _RowValuesState({this.configArray, this.rowContaints, this.rowUpdate});

  _readConfig() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      configArray[0]['maxColumn'] = prefs.getString('maxColumn') ?? '4';
      configArray[0]['totalRows'] = prefs.getString('totalRows') ?? '10';
      configArray[0]['totalLoopTime'] =
          prefs.getString('totalLoopTime') ?? '6000';
      configArray[0]['commonCathode'] = prefs.getString('commonCathode') ?? '1';
    });
  }

  _readRowValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      List<Map<String, List<Map<String, String>>>> rC =
          new List<Map<String, List<Map<String, String>>>>();
      rowContaints.clear();
      for (int i = 0; i < int.parse(configArray[0]['totalRows']); i++) {
        rC[i]['rows'][0]['size'] =
            prefs.getString('rowValues_list_size_$i') ?? '';
        rC[i]['rows'][0]['value'] =
            prefs.getString('rowValues_list_value_$i') ?? '';
        rowContaints.addAll(rC);
      }
    });
  }

  @override
  void initState() {
    setState(() {
      _readConfig();
      _readRowValues();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < int.parse(configArray[0]['totalRows']); i++)
              ...rowContaints[i]['rows'].map((rows) {
                return RowValue(
                  rowUpdate: rowUpdate,
                  rowIndex: i,
                  rowSize: rows['size'],
                  rowNumber: rows['value'],
                );
              }).toList(),
          ],
        ),
      ),
    );
  }
}
