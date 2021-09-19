import 'package:flutter/material.dart';
import 'package:bike_tracking/controller/global.dart';
import 'package:bike_tracking/view/trip_page.dart';

class RecordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Global.tripList.trip.length != 0)
      return ListView.builder(
          itemCount: Global.tripList.trip.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 5, top: 5),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1))
              ]),
              child: ListTile(
                title: new Text(
                    '${Global.tripList.trip[index].startTime} - ${Global.tripList.trip[index].endTime}'),
                onTap: () {
                  print(index);
                  Navigator.push(
                      (context),
                      new MaterialPageRoute(
                          builder: (context) =>
                              new TripPage(Global.tripList.trip[index])));
                },
              ),
            );
          });
    else
      return Center(
        child: Text("No record"),
      );
  }
}
