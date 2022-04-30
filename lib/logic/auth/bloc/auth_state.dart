part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

class AuthSuccess extends AuthState {
  final AuthDataModel platforms;

  AuthSuccess(this.platforms);
}

class NotAuthenticatedState extends AuthState {}
