import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bike_tracking/controller/global.dart';
import 'package:bike_tracking/model/trip_list.dart';

class TripPage extends StatelessWidget {
  final Trip thisTrip;

  TripPage(this.thisTrip);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Record'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(bottom: 5),
                  height: 150,
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
                            "Start time",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        Text(thisTrip.startTime),
                        Spacer(flex: 2),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "End time",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        Text(thisTrip.endTime),
                        Spacer(flex: 2),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Vehicle",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                        Text(thisTrip.vehicleType),
                      ],
                    ),
                  )),
              Expanded(
                  child: Container(
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
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: thisTrip.data.length,
                  itemBuilder: (context, index) {
                    return new ListTile(
                        title: new Text('${thisTrip.data[index].timestamp}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Accelerometer " +
                                thisTrip.data[index].accelerometer.join(", ")),
                            Text("UserAccelerometer " +
                                thisTrip.data[index].userAccelerometer
                                    .join(", ")),
                            Text("Gyroscope: " +
                                thisTrip.data[index].gyroscope.join(", ")),
                            Text("Magnetometer: " +
                                thisTrip.data[index].magnetometer.join(",")),
                          ],
                        ));
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    height: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ))
            ]));
  }
}
