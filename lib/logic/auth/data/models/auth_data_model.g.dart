// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthDataModel _$AuthDataModelFromJson(Map<String, dynamic> json) =>
    AuthDataModel(
      json['refresh'] as String,
      json['access'] as String,
    );

Map<String, dynamic> _$AuthDataModelToJson(AuthDataModel instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
    };
