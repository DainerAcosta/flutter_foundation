import 'package:flutter_template/src/data/providers/remote/auth_provider/auth_provider.dart';
import 'package:flutter_template/src/data/repositories/auth_repository.dart';
import 'package:flutter_template/src/domain/entities/session.dart';

class _AuthRepositoryImpl implements AuthRepository {
  final AuthProvider _authProvider;

  _AuthRepositoryImpl(this._authProvider);

  @override
  Future<Session?> login({required String email, required String password}) {
    return _authProvider.login(email, password);
  }
}

final authRepositoryImpl = _AuthRepositoryImpl(authProvider);
