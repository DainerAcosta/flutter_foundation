import 'dart:developer';

import 'package:dio/dio.dart';

class _HttpClient {
  static final _HttpClient _instance = _HttpClient._();

  _HttpClient._();

  static _HttpClient get instance => _instance;

  Dio getHttp() {
    final options = BaseOptions(
      baseUrl: 'https://www.xx.com/api',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    final dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        log('REQUEST[${options.method}] => PATH: ${options.path}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
        return handler.next(response);
      },
      onError: (DioError err, handler) {
        log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
        return handler.next(err);
      })
    );
    return dio;
  }
}

final httpClient = _HttpClient.instance.getHttp();
