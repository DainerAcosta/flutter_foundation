import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/src/app/auth/auth.dart';
import 'package:flutter_template/src/app/common/theme/theme.dart';
import 'package:flutter_template/src/app/routes/pages.dart';
import 'package:flutter_template/src/app/routes/routes.dart';
import 'package:flutter_translate/flutter_translate.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        builder: (context, child) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthStatus.authenticated:
                  _navigator.pushNamedAndRemoveUntil(Routes.home, (route) => false,);
                  break;
                case AuthStatus.unauthenticated:
                  _navigator.pushNamedAndRemoveUntil(Routes.signIn, (route) => false,);
                  break;
                case AuthStatus.unknown:
                  break;
              }
            },
            child: child,
          );
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        theme: FlutterAppTheme.light,
        darkTheme: FlutterAppTheme.dark,
        initialRoute: Pages.initial,
        routes: Pages.routes,
      ),
    );
  }
}
