import 'package:flutter_template/src/domain/entities/session.dart';

abstract class AuthMapper {
  static mapToSession(Map<String, dynamic> data) {
    return Session(
      accessToken: data['accessToken'],
      refreshToken: data['refreshToken'],
    );
  }
}
