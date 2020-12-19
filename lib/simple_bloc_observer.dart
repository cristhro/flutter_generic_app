import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    // ignore: avoid_print
    print('debug: $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    // ignore: avoid_print
    print('debug: $error');
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    // ignore: avoid_print
    print('debug: $change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // ignore: avoid_print
    print('debug: $transition');
    super.onTransition(bloc, transition);
  }
}
