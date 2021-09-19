import 'package:json_annotation/json_annotation.dart';

part 'trip_list.g.dart';


@JsonSerializable()
class TripList extends Object {

  @JsonKey(name: 'trip')
  List<Trip> trip;

  TripList(this.trip,);

  factory TripList.fromJson(Map<String, dynamic> srcJson) => _$TripListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TripListToJson(this);

}


@JsonSerializable()
class Trip extends Object {

  @JsonKey(name: 'startTime')
  String startTime;

  @JsonKey(name: 'endTime')
  String endTime;

  @JsonKey(name: 'vehicleType')
  String vehicleType;

  @JsonKey(name: 'data')
  List<Data> data;

  Trip(this.startTime,this.endTime,this.vehicleType,this.data,);

  factory Trip.fromJson(Map<String, dynamic> srcJson) => _$TripFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TripToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'timestamp')
  String timestamp;

  @JsonKey(name: 'accelerometer')
  List<double> accelerometer;

  @JsonKey(name: 'userAccelerometer')
  List<double> userAccelerometer;

  @JsonKey(name: 'gyroscope')
  List<double> gyroscope;

  @JsonKey(name: 'magnetometer')
  List<double> magnetometer;

  Data(this.timestamp,this.accelerometer,this.userAccelerometer,this.gyroscope,this.magnetometer,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


