import 'dart:convert';
import 'dart:io';
import 'package:bike_tracking/model/trip_list.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

//
//The prefs is only accessed when launching the app and exiting the app
//
class Global {
  static TripList tripList = new TripList(<Trip>[]);
  static bool permissionGranted = false;
  static String vehicleType = "Bikes";
  static double currentIntervalValue = 5;

  static Future loadDataFromFile() async {
    Directory? tempDir = await getExternalStorageDirectory();
    File file = File(tempDir!.path + '/tracking_data.txt');
    if (await file.exists())
      tripList = TripList.fromJson(jsonDecode(await file.readAsString()));
    else {
      print("No data file on phone");
    }
  }

  static Future deleteAllRecords() async {
    Directory? tempDir = await getExternalStorageDirectory();
    File file = File(tempDir!.path + '/tracking_data.txt');
    if (await file.exists()) await file.delete();
    tripList.trip.clear();
  }

  static Future dispose() async {
    Directory? tempDir = await getExternalStorageDirectory();
    print(tempDir.toString());
    File file = File(tempDir!.path + '/tracking_data.txt');
    await file.writeAsString(jsonEncode(tripList.toJson()));
  }

  static Future init() async {
    print("init!");
  }
}
