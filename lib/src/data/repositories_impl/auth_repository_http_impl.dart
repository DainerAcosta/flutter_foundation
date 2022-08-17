import 'package:flutter_template/src/data/providers/remote/auth_http_provider/auth_http_provider.dart';
import 'package:flutter_template/src/data/repositories/auth_repository.dart';
import 'package:flutter_template/src/domain/entities/session.dart';

class _AuthRepositoryHttpImpl implements AuthRepository {
  final AuthHttpProvider _authProvider;

  _AuthRepositoryHttpImpl(this._authProvider);

  @override
  Future<Session?> login({required String email, required String password}) {
    return _authProvider.login(email, password);
  }
}

final authRepositoryHttpImpl = _AuthRepositoryHttpImpl(authHttpProvider);