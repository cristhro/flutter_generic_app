import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_generic_app/locator.dart';
import 'package:flutter_generic_app/simple_bloc_observer.dart';

import 'app.dart';
import 'services/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  final ErrorService _errorService = ErrorService();
  final AuthenticationService _authServ = locator<AuthenticationService>();
  //TODO:### final AnalyticsService _analyticsServ = locator<AnalyticsService>();
  
  disableErrorWidget();

  await disableLandscapeMode();
  // await locator<AuthenticationService>().tryLoadSession();
  await _authServ.trackApplicationVersion();
  await Firebase.initializeApp();

  FlutterError.onError = (FlutterErrorDetails details) async { 
    if(!kReleaseMode){
      FlutterError.dumpErrorToConsole(details);
    }else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

   runZoned<Future<void>>(() async { 
      runApp(App(authenticationRepository: AuthenticationRepository()));
      EquatableConfig.stringify = kDebugMode;
      Bloc.observer = SimpleBlocObserver();

    }, onError: (error, stackTrace) async {
      await _errorService.reportError(error, stackTrace);
    });
}

void disableErrorWidget(){
  if (kReleaseMode) {
    ErrorWidget.builder = (details) {
      // ignore: avoid_print
      print('Error widget ttreiggered on: ${details.exception}');
      // ignore: avoid_print
      print(details.stack.toString());
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