import 'package:graphql/client.dart';

class _GraphqlClient {
  const _GraphqlClient({required this.graphQLClient});

  factory _GraphqlClient.create({required String url}) {
    final httpLink = HttpLink(url);
    final link = Link.from([httpLink]);
    return _GraphqlClient(
      graphQLClient: GraphQLClient(cache: GraphQLCache(), link: link),
    );
  }

  final GraphQLClient graphQLClient;
}

final gqlClient =
    _GraphqlClient.create(url: 'https://api.graphql.jobs').graphQLClient;
