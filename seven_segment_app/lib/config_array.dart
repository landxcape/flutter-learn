import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigArray extends StatefulWidget {
  final Function configUpdate;
  final List<Map<String, String>> configArray;

  ConfigArray({@required this.configUpdate, @required this.configArray});

  @override
  _ConfigArrayState createState() =>
      _ConfigArrayState(configUpdate: configUpdate, configArray: configArray);
}

class _ConfigArrayState extends State<ConfigArray> {
  final Function configUpdate;
  List<Map<String, String>> configArray;

  int configIndex = 0;
  String maxColumn;
  String totalRows;
  String totalLoopTime;
  String commonCathode;

  final TextEditingController maxColumnController = new TextEditingController();
  final TextEditingController totalRowsController = new TextEditingController();
  final TextEditingController totalLTController = new TextEditingController();
  final TextEditingController commonCController = new TextEditingController();

  _ConfigArrayState({this.configUpdate, this.configArray});

  maxColumnListener() {
    setState(() {
      maxColumn = maxColumnController.text;
      configUpdate(configIndex, 'maxColumn', maxColumn);
    });
  }

  totalRowsListener() {
    setState(() {
      totalRows = totalRowsController.text;
      configUpdate(configIndex, 'totalRows', totalRows);
    });
  }

  totalLTListener() {
    setState(() {
      totalLoopTime = totalLTController.text;
      configUpdate(configIndex, 'totalLoopTime', totalLoopTime);
    });
  }

  commonCListener() {
    setState(() {
      commonCathode = commonCController.text;
      configUpdate(configIndex, 'commonCathode', commonCathode);
    });
  }

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

  @override
  void initState() {
    setState(() {
      _readConfig();
      maxColumnController.text = configArray[0]['maxColumn'];
      totalRowsController.text = configArray[0]['totalRows'];
      totalLTController.text = configArray[0]['totalLoopTime'];
      commonCController.text = configArray[0]['commonCathode'];

      maxColumnController.addListener(maxColumnListener);
      totalRowsController.addListener(totalRowsListener);
      totalLTController.addListener(totalLTListener);
      commonCController.addListener(commonCListener);
    });

    super.initState();
  }

  @override
  void dispose() {
    maxColumnController.dispose();
    totalRowsController.dispose();
    totalLTController.dispose();
    commonCController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text('Max Columns'),
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.end,
                    controller: maxColumnController,
                    maxLength: 2,
                    maxLengthEnforced: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Max Columns',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text('Total Rows'),
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.end,
                    controller: totalRowsController,
                    maxLength: 2,
                    maxLengthEnforced: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Total Rows',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text('Loop Time'),
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.end,
                    controller: totalLTController,
                    maxLength: 4,
                    maxLengthEnforced: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: 'Total Loop Time',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Text('Common Cathode'),
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.end,
                    controller: commonCController,
                    maxLength: 1,
                    maxLengthEnforced: true,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: '1 or 0',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
