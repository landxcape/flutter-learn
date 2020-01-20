import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < int.parse(configArray[0]['totalRows']); i++)
              ...(rowContaints[i]['rows'] as List<Map<String, Object>>)
                  .map((rows) {
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
