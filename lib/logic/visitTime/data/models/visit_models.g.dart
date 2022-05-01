// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitTimeModel _$VisitTimeModelFromJson(Map<String, dynamic> json) =>
    VisitTimeModel(
      json['id'] ?? 0 as int,
      json['user'] ?? 0  as int,
      json['action_in'] ?? '' as String,
      json['date_in']  ?? '' as String,
      json['time_in']  ?? '' as String,
      json['action_out']  ?? '' as String,
      json['date_out'] ?? '' as String,
      json['time_out'] ?? '' as String,
    );

Map<String, dynamic> _$VisitTimeModelToJson(VisitTimeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'action_in': instance.actionIn,
      'date_in': instance.dateIn,
      'time_in': instance.timeIn,
      'action_out': instance.actionOut,
      'date_out': instance.dateOut,
      'time_out': instance.timeOut,
    };
