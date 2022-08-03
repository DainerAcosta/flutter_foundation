import 'package:flutter_template/src/data/providers/remote/auth_provider/queries/login_mutation.dart';
import 'package:flutter_template/src/domain/entities/session.dart';
import 'package:flutter_template/src/mapper/auth_mapper.dart';
import 'package:graphql/client.dart';

class LoginFailure implements Exception {}

class AuthProvider {
  AuthProvider({required this.graphQLClient});

  final GraphQLClient graphQLClient;

  Future<Session> login(String user, String password) async {
    final result = await graphQLClient.query<String>(QueryOptions(
      document: gql(loginMutation),
      variables: {"user": user, "password": password},
    ));

    if (result.hasException) throw LoginFailure();

    return AuthMapper.mapToSession(result.data!);
  }
}
