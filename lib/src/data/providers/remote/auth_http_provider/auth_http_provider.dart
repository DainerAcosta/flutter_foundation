import 'package:dio/dio.dart';
import 'package:flutter_template/src/data/providers/clients/http_client.dart';
import 'package:flutter_template/src/domain/entities/session.dart';

class _LoginFailure implements Exception {}

class AuthHttpProvider {
  AuthHttpProvider({required this.httpClient});

  final Dio httpClient;

  Future<Session> login(String user, String password) async {
    return await Future.delayed(
      const Duration(milliseconds: 1000),
      () => Session(accessToken: '', refreshToken: ''),
    );
    // final result = await httpClient.post<Session>('');

    // if (result.statusCode != 200) throw _LoginFailure();

    // return result.data!;
  }
}

final authHttpProvider = AuthHttpProvider(httpClient: httpClient);