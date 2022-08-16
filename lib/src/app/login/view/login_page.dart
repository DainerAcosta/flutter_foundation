import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/app/auth/auth.dart';
import 'package:flutter_template/src/app/login/bloc/login_bloc.dart';
import 'package:flutter_template/src/app/login/view/login_form.dart';
import 'package:flutter_template/src/data/repositories_impl/auth_repository_impl.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authRepository: authRepositoryImpl,
              authBloc: context.read<AuthBloc>(),
            );
          },
          child: const LoginForm(),
        ),
      ),
    );
  }
}
