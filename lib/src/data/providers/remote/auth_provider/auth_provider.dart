import 'package:flutter_template/src/data/providers/remote/auth_provider/queries/login_mutation.dart';
import 'package:graphql/client.dart';

class AuthProvider {
  AuthProvider({required this.graphQLClient});

  final GraphQLClient graphQLClient;

  Future<dynamic> login(String user, String password) async {
    final result = await graphQLClient.query<String>(QueryOptions(
      document: gql(loginMutation),
      variables: {"user": user, "password": password},
    ));

    return result;
  }
}
