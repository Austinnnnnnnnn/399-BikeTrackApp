import 'package:flutter/material.dart';
import 'package:bike_tracking/controller/global.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Time Interval",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ),
                  Slider(
                      value: Global.currentIntervalValue,
                      min: 5,
                      max: 20,
                      divisions: 3,
                      label: Global.currentIntervalValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          Global.currentIntervalValue = value;
                        });
                      }),
                  Text(Global.currentIntervalValue.round().toString() + " seconds"),
                ],
              ),
            )),
        Container(
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Privacy",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => {Global.deleteAllRecords()},
                    child: Text("Delete all records"),
                  )
                ],
              ),
            ))
      ],
    );
  }
}

/*
Column(
      children: [
        Text('Time interval'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child:
        Text(_currentSliderValue.round().toString())
      ],
    )
 */
