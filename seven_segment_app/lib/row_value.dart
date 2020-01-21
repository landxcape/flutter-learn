import 'package:flutter/material.dart';

class RowValue extends StatefulWidget {
  final Function rowUpdate;

  final int rowIndex;
  final String rowSize;
  final String rowNumber;

  RowValue({
    this.rowUpdate,
    this.rowIndex,
    this.rowSize,
    this.rowNumber,
  });

  @override
  _RowValueState createState() => _RowValueState(
        rowUpdate: rowUpdate,
        rowIndex: rowIndex,
        rowSize: rowSize,
        rowNumber: rowNumber,
      );
}

class _RowValueState extends State<RowValue> {
  final Function rowUpdate;

  final int rowIndex;
  String rowSize;
  String rowNumber;

  final TextEditingController rowSizeController = new TextEditingController();
  final TextEditingController rowNumberController = new TextEditingController();

  _RowValueState({this.rowUpdate, this.rowIndex, this.rowSize, this.rowNumber});

  rowSizeListener() {
    rowSize = rowSizeController.text;
    rowUpdate(rowIndex, 'size', rowSize);
  }

  rowValueListener() {
    rowNumber = rowNumberController.text;
    while (rowNumber.length < int.parse(rowSize)) {
      rowNumber = '0' + rowNumber;
    }
    rowUpdate(rowIndex, 'value', rowNumber);
  }

  @override
  void initState() {
    super.initState();

    rowSizeController.text = rowSize;
    rowNumberController.text = rowNumber;
    rowSizeController.addListener(rowSizeListener);
    rowNumberController.addListener(rowValueListener);
  }

  @override
  void dispose() {
    rowNumberController.dispose();
    rowSizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text('Row $rowIndex'),
        ),
        Expanded(
          child: TextField(
            textAlign: TextAlign.center,
            controller: rowSizeController,
            maxLength: 1,
            maxLengthEnforced: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Row $rowIndex',
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          flex: 2,
          child: TextField(
            textAlign: TextAlign.end,
            controller: rowNumberController,
            // maxLength: int.parse(rowSize),
            // maxLengthEnforced: true,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Row $rowIndex',
            ),
          ),
        ),
      ],
    );
  }
}
