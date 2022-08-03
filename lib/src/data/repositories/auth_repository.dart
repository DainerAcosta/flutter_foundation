import 'package:flutter_template/src/domain/entities/session.dart';

abstract class AuthRepository {
  Future<Session?> login({required String email, required String password});
}
