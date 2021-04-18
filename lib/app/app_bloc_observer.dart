import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    developer.log('debug: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    developer.log('debug: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    developer.log('debug: $change');
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    developer.log('debug: $transition');
    super.onTransition(bloc, transition);
  }
}
