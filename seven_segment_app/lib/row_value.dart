import 'package:flutter/material.dart';

class RowValue extends StatefulWidget {
  final int rowIterate;
  final int rowSize;
  final int rowNumber;

  RowValue({this.rowIterate, this.rowSize, this.rowNumber});

  @override
  _RowValueState createState() => _RowValueState(
      rowIterate: rowIterate, rowSize: rowSize, rowNumber: rowNumber);
}

class _RowValueState extends State<RowValue> {
  final int rowIterate;
  final int rowSize;
  final int rowNumber;
  final TextEditingController myController = new TextEditingController();

  textListener() {
    print('text $rowIterate: ${myController.text}');
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(textListener);
    myController.text = '$rowNumber';
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  _RowValueState({this.rowIterate, this.rowSize, this.rowNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text('Row $rowIterate'),
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: myController,
            maxLength: rowSize,
            maxLengthEnforced: true,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Row $rowIterate',
            ),
          ),
        ),
      ],
    );
  }
}
