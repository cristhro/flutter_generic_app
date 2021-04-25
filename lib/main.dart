import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_generic_app/app/app_bloc_observer.dart';
import 'package:flutter_generic_app/core/blocs/language_bloc.dart';
import 'package:flutter_generic_app/data/services/firebase_crashlytics_service.dart';
import 'package:flutter_generic_app/di/injection_container.dart';
import 'app/app.dart';
import 'data/repositories/auth_repository.dart';
import 'data/services/error_service.dart';
import 'di/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  disableErrorWidget();

  await disableLandscapeMode();
  await Firebase.initializeApp();

  FlutterError.onError = getIt<FirebaseCrashlyticsService>().recordFlutterError;

  runZoned<Future<void>>(() async {
    runApp(
      new BlocProvider(
        create: (_) => LanguageBloc()..add(LanguageLoadStarted()),
        child: App(
          authenticationRepository: AuthRepository(),
        ),
      ),
    );

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
