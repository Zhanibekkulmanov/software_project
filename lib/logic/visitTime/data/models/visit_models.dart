import 'package:json_annotation/json_annotation.dart';

part 'visit_models.g.dart';

@JsonSerializable()
class VisitTimeModel {
  final int id;
  final int user;
  @JsonKey(name: "action_in")
  final String actionIn;
  @JsonKey(name: "date_in")
  final String dateIn;
  @JsonKey(name: "time_in")
  final String timeIn;
  @JsonKey(name: "action_out")
  final String actionOut;
  @JsonKey(name: "date_out")
  final String dateOut;
  @JsonKey(name: "time_out")
  final String timeOut;


  factory VisitTimeModel.fromJson(Map<String, dynamic> json) => _$VisitTimeModelFromJson(json);

  VisitTimeModel(this.id, this.user, this.actionIn, this.dateIn, this.timeIn, this.actionOut, this.dateOut, this.timeOut);

  Map<String, dynamic> toJson() => _$VisitTimeModelToJson(this);
}
