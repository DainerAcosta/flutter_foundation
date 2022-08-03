import 'package:bloc/bloc.dart';
import 'package:flutter_template/src/data/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<SessionFetch>(_onSessionFetch);
  }

  final AuthRepository _authRepository;

  Future<void> _onSessionFetch(
    SessionFetch event,
    Emitter<AuthState> emit,
  ) async {
    // emit();
    try {
      final session = await _authRepository.login(
          email: event.email, password: event.password);
      // emit();
    } catch (_) {
      // emit();
    }
  }
}
