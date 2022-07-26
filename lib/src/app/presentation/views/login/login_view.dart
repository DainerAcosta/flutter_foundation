import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(translate('login.title')),
          ],
        ),
      ),
    );
  }
}
