import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:software_project/logic/visitTime/data/models/visit_models.dart';
import 'package:software_project/logic/visitTime/data/repositories/visit_repository.dart';

part 'visit_time_event.dart';
part 'visit_time_state.dart';

class VisitTimeBloc extends Bloc<VisitTimeEvent, VisitTimeState> {

  final VisitTimeRepository visitTimeRepository;

  VisitTimeBloc(this.visitTimeRepository) : super(VisitTimeInitial()) {
    on<VisitTimeLoad>((event, emit) async {
      emit(VisitTimeLoading());
      try {
        final List<VisitTimeModel> time = await visitTimeRepository.getTime();

        emit(VisitTimeSuccess(time));
      } catch (e) {
        emit(VisitTimeFailure(e.toString()));
      }
    });
  }
}
