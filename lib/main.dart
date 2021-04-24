import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_generic_app/app/app_bloc_observer.dart';
import 'package:flutter_generic_app/data/services/firebase_crashlytics_service.dart';
import 'package:flutter_generic_app/di/injection.dart';
import 'package:flutter_generic_app/ui/services/index.dart';
import 'package:injectable/injectable.dart';

import 'app/app.dart';
import 'data/repositories/auth_repository.dart';
import 'data/services/error_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection(Environment.prod);

  // final AuthService _authServ = locator<AuthService>();
  //final IAnalyticsService _analyticsServ = getIt<FirebaseAnalyticsService>();

  disableErrorWidget();

  await disableLandscapeMode();
  // await locator<AuthenticationService>().tryLoadSession();
  // await _authServ.trackApplicationVersion();
  await Firebase.initializeApp();

  FlutterError.onError = getIt<FirebaseCrashlyticsService>().recordFlutterError;

  runZoned<Future<void>>(() async {
    runApp(App(authenticationRepository: AuthRepository()));
    EquatableConfig.stringify = kDebugMode;
    Bloc.observer = AppBlocObserver();
  // ignore: deprecated_member_use
  }, onError: (error, stackTrace) async {
    await getIt<ErrorService>().reportError(error, stackTrace);
  });
}

void disableErrorWidget() {
  if (kReleaseMode) {
    ErrorWidget.builder = (details) {
      developer.log('Error widget ttreiggered on: ${details.exception}');
      developer.log(details.stack.toString());
      return Container();
    };
  }
}

Future<void> disableLandscapeMode() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
