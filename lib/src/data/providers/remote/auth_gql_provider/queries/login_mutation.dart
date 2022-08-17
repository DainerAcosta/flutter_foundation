const loginMutation = r'''
  mutation LoginMutation($user: String!, $password: String!) {
    auth {
      access_token
      refresh_token
    }
  }
''';
