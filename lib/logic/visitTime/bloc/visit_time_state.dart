part of 'visit_time_bloc.dart';

@immutable
abstract class VisitTimeState {}

class VisitTimeInitial extends VisitTimeState {}

class VisitTimeLoading extends VisitTimeState {}

class VisitTimeSuccess extends VisitTimeState {
  final List<VisitTimeModel> time;

  VisitTimeSuccess(this.time);
}

class VisitTimeFailure extends VisitTimeState {
  final String message;

  VisitTimeFailure(this.message);
}
