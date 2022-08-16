import 'dart:developer';

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate Bloc-- ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('${bloc.runtimeType} $event');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('$transition');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('onClose Bloc-- ${bloc.runtimeType}');
  }
}
