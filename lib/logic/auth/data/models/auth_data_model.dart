import 'package:json_annotation/json_annotation.dart';

part 'auth_data_model.g.dart';

@JsonSerializable()
class AuthDataModel {
  final String refresh;
  final String access;


  factory AuthDataModel.fromJson(Map<String, dynamic> json) => _$AuthDataModelFromJson(json);

  AuthDataModel(this.refresh, this.access);

  Map<String, dynamic> toJson() => _$AuthDataModelToJson(this);
}
