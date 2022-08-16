import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState(status: AuthStatus.unauthenticated)) {
    on<AuthStatusChanged>(_onAuthStatusChanged);
    on<AuthStatusCurrent>(_onAuthStatusCurrent);
  }

  @override
  Future<void> close() {
    return super.close();
  }

  Future<void> _onAuthStatusChanged(
    AuthStatusChanged event,
    Emitter<AuthState> emit,
  ) async =>
      emit(state.copyWith(status: event.status));

  Future<void> _onAuthStatusCurrent(
    AuthStatusCurrent event,
    Emitter<AuthState> emit,
  ) async =>
      emit(state.copyWith(status: state.status));

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      return AuthState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toJson();
  }
}
