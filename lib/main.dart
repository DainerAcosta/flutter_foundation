import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/app.dart';
import 'package:flutter_template/app_bloc_observer.dart';
import 'package:flutter_template/src/app/auth/auth.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationSupportDirectory(),
  );
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'es_ES',
    supportedLocales: ['es_ES'],
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(AuthStatusCurrent()))
      ],
      child: LocalizedApp(delegate, const App()),
    )),
    blocObserver: AppBlocObserver(),
    storage: storage,
  );
}
