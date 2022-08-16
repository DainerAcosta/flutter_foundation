part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus status;

  const AuthState({
    required this.status,
  });

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      AuthState(status: json["status"] as AuthStatus);

  Map<String, dynamic> toJson() => {
        "status": status.toString(),
      };

  AuthState copyWith({AuthStatus? status}) {
    return AuthState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
