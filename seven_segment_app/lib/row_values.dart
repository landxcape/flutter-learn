import 'package:flutter/material.dart';

import './row_value.dart';

class RowValues extends StatefulWidget {
  final List<Map<String, Object>> rowContaints;

  RowValues({@required this.rowContaints});

  @override
  _RowValuesState createState() => _RowValuesState(rowContaints: rowContaints);
}

class _RowValuesState extends State<RowValues> {
  final List<Map<String, Object>> rowContaints;

  _RowValuesState({this.rowContaints});

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
                  rowIterate: i,
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
