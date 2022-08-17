import 'package:flutter/material.dart';
import 'package:flutter_template/src/app/home/home.dart';
import 'package:flutter_template/src/app/login/login.dart';
import 'package:flutter_template/src/app/routes/routes.dart';
import 'package:flutter_template/src/app/splash/view/splash_page.dart';

abstract class Pages {
  static const String initial = Routes.loading;

  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.loading: (_) => const SplashPage(),
    Routes.signIn: (_) => const LoginPage(),
    Routes.home: (_) => const HomePage(),
  };
}