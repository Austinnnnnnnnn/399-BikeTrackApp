import 'package:flutter/material.dart';
import 'package:bike_tracking/controller/global.dart';
import 'tracking_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String selectValue = 'Bikes';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Choose Vehicle Type:'),
          DropdownButton<String>(
            focusColor: Colors.white,
            value: selectValue,
            onChanged: (value) {
              setState(() {
                Global.vehicleType = value!;
                selectValue = value;
              });
            },
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            //iconEnabledColor: Colors.teal[800],
            items: <String>[
              'Bikes',
              'Buses',
              'Trains',
              'E-Scooters',
              'Cars',
              'On foot',
              'Others',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            hint: Text(
              "Vehicle Type",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          ElevatedButton(
            child: const Text(
              "Start Tracking",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            onPressed: () {
              Navigator.push(
                  (context),
                  new MaterialPageRoute(
                      builder: (context) => new TrackingPage()));
            },
          ),
        ],
      ),
    );
  }
}
