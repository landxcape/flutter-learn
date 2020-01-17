import 'package:flutter/material.dart';

import './row_value.dart';

class RowValues extends StatefulWidget {
  final List<Map<String, Object>> config;
  final List<Map<String, Object>> rowContaints;
  final Function rowUpdate;

  RowValues({
    @required this.config,
    @required this.rowContaints,
    @required this.rowUpdate,
  });

  @override
  _RowValuesState createState() => _RowValuesState(
        config: config,
        rowContaints: rowContaints,
        rowUpdate: rowUpdate,
      );
}

class _RowValuesState extends State<RowValues> {
  List<Map<String, Object>> config;
  final List<Map<String, Object>> rowContaints;
  final Function rowUpdate;

  _RowValuesState({this.config, this.rowContaints, this.rowUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < rowContaints.length; i++)
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
