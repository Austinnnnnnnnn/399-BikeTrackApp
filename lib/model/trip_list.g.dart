// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripList _$TripListFromJson(Map<String, dynamic> json) {
  return TripList(
    (json['trip'] as List<dynamic>)
        .map((e) => Trip.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TripListToJson(TripList instance) => <String, dynamic>{
      'trip': instance.trip,
    };

Trip _$TripFromJson(Map<String, dynamic> json) {
  return Trip(
    json['startTime'] as String,
    json['endTime'] as String,
    json['vehicleType'] as String,
    (json['data'] as List<dynamic>)
        .map((e) => Data.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'vehicleType': instance.vehicleType,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['timestamp'] as String,
    (json['accelerometer'] as List<dynamic>)
        .map((e) => (e as num).toDouble())
        .toList(),
    (json['userAccelerometer'] as List<dynamic>)
        .map((e) => (e as num).toDouble())
        .toList(),
    (json['gyroscope'] as List<dynamic>)
        .map((e) => (e as num).toDouble())
        .toList(),
    (json['magnetometer'] as List<dynamic>)
        .map((e) => (e as num).toDouble())
        .toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'accelerometer': instance.accelerometer,
      'userAccelerometer': instance.userAccelerometer,
      'gyroscope': instance.gyroscope,
      'magnetometer': instance.magnetometer,
    };
