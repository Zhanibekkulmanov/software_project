import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../data/models/auth_data_model.dart';
import '../data/repositories/auth_repository.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokensRepository authRepository;
  Box box = Hive.box('tokens');

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthSubmitted>((event, emit) async {
      emit(AuthLoading());
      try {
        final AuthDataModel platforms = await authRepository.getTokens(event.username, event.password);

        emit(AuthSuccess(platforms));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
    on<LogOutEvent>((event, emit) async {
      authRepository.logOut();
      emit(NotAuthenticatedState());
    });
  }

}
