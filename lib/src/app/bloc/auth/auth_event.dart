part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SessionFetch extends AuthEvent {
  final String email, password;

  SessionFetch({
    required this.email,
    required this.password,
  });
}
