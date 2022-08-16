import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/src/app/auth/auth.dart';
import 'package:flutter_template/src/app/login/models/models.dart';
import 'package:flutter_template/src/data/repositories/auth_repository.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthRepository authRepository,
    required AuthBloc authBloc,
  })  : _authRepository = authRepository,
        _authBloc = authBloc,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthRepository _authRepository;
  final AuthBloc _authBloc;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([state.password, email]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([password, state.email]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _authRepository.login(
          email: state.email.value,
          password: state.password.value,
        );
        _authBloc.add(const AuthStatusChanged(AuthStatus.authenticated));
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
