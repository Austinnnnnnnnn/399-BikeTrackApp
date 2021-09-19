import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bike_tracking/controller/entity_controller.dart';
import 'package:bike_tracking/controller/global.dart';
import 'package:bike_tracking/model/trip_list.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:intl/intl.dart';

class TrackingPage extends StatefulWidget {
  TrackingPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  List<double>? _accelerometerValues;
  List<double>? _userAccelerometerValues;
  List<double>? _gyroscopeValues;
  List<double>? _magnetometerValues;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  final startTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  late Timer _timer;
  late Trip thisTrip;

  @override
  Widget build(BuildContext context) {
    var accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
    var gyroscope =
        _gyroscopeValues?.map((double v) => v.toStringAsFixed(1)).toList();
    var userAccelerometer = _userAccelerometerValues
        ?.map((double v) => v.toStringAsFixed(1))
        .toList();
    var magnetometer =
        _magnetometerValues?.map((double v) => v.toStringAsFixed(1)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking...'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("Data will be recorded every " +
              Global.currentIntervalValue.round().toString() +
              "s"),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('Start time: ' + startTime)],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Accelerometer: $accelerometer'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('UserAccelerometer: $userAccelerometer'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Gyroscope: $gyroscope'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Magnetometer: $magnetometer'),
                    ],
                  ),
                ),
                ElevatedButton(
                  child: const Text(
                    "End Tracking",
                  ),
                  onPressed: () {
                    _timer.cancel();
                    thisTrip.endTime = DateFormat('yyyy-MM-dd HH:mm:ss')
                        .format(DateTime.now());
                    Global.tripList.trip.add(thisTrip);
                    Global.dispose();
                    dispose();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    thisTrip = new Trip(startTime, startTime, Global.vehicleType, <Data>[]);
    _streamSubscriptions.add(
      accelerometerEvents.listen(
        (AccelerometerEvent event) {
          setState(() {
            _accelerometerValues = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
    _streamSubscriptions.add(
      gyroscopeEvents.listen(
        (GyroscopeEvent event) {
          setState(() {
            _gyroscopeValues = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
    _streamSubscriptions.add(
      userAccelerometerEvents.listen(
        (UserAccelerometerEvent event) {
          setState(() {
            _userAccelerometerValues = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
    _streamSubscriptions.add(
      magnetometerEvents.listen(
        (MagnetometerEvent event) {
          setState(() {
            _magnetometerValues = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
    //
    //
    // The timer is here!
    //
    //
    _timer = Timer.periodic(
        Duration(seconds: Global.currentIntervalValue.round()), (timer) {
      Data data = new Data(
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          _accelerometerValues!,
          _gyroscopeValues!,
          _userAccelerometerValues!,
          _magnetometerValues!);
      thisTrip.data.add(data);
      //print(_accelerometerValues);
    });
  }
}
