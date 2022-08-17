import 'package:flutter_template/src/data/providers/clients/graphql_client.dart';
import 'package:flutter_template/src/data/providers/remote/auth_gql_provider/queries/login_mutation.dart';
import 'package:flutter_template/src/domain/entities/session.dart';
import 'package:flutter_template/src/mapper/mapper_impl/session_mapper_impl.dart';
import 'package:graphql/client.dart';

class _LoginFailure implements Exception {}

class AuthGqlProvider {
  AuthGqlProvider({required this.graphQLClient});

  final GraphQLClient graphQLClient;

  Future<Session> login(String user, String password) async {
    final result = await graphQLClient.query<String>(QueryOptions(
      document: gql(loginMutation),
      variables: {"user": user, "password": password},
    ));

    if (result.hasException) throw _LoginFailure();

    return sessionMapper.fromJson(result.data!);
  }
}

final authGqlProvider = AuthGqlProvider(graphQLClient: gqlClient);
