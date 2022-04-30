part of 'auth_bloc.dart';

abstract class AuthEvent {}

class CheckAuthorization extends AuthEvent {}

class AuthSubmitted extends AuthEvent {
  final String username;
  final String password;

  AuthSubmitted(this.username, this.password);
}


class LogOutEvent extends AuthEvent {}
