import 'package:flutter_template/src/data/providers/remote/auth_gql_provider/auth_gql_provider.dart';
import 'package:flutter_template/src/data/repositories/auth_repository.dart';
import 'package:flutter_template/src/domain/entities/session.dart';

class _AuthRepositoryGqlImpl implements AuthRepository {
  final AuthGqlProvider _authProvider;

  _AuthRepositoryGqlImpl(this._authProvider);

  @override
  Future<Session?> login({required String email, required String password}) {
    return _authProvider.login(email, password);
  }
}

final authRepositoryGqlpImpl = _AuthRepositoryGqlImpl(authGqlProvider);
