import 'package:flutter_template/src/domain/entities/session.dart';
import 'package:flutter_template/src/mapper/mapper.dart';

class _SessionMapper implements Mapper<Map<String, dynamic>, Session> {
  @override
  Session fromJson(Map<String, dynamic> json) {
    return Session(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  @override
  List<Session> fromJsonList(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((e) => fromJson(e)).toList();
  }
}

final sessionMapper = _SessionMapper();
