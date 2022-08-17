import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/app/auth/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                final status = context.select(
                  (AuthBloc bloc) => bloc.state.status,
                );
                return Text('Status: ${status.name}');
              },
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                context
                    .read<AuthBloc>()
                    .add(const AuthStatusChanged(AuthStatus.unauthenticated));
              },
            ),
          ],
        ),
      ),
    );
  }
}
