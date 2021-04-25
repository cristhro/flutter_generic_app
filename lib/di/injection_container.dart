import 'package:flutter_generic_app/data/repositories/auth_repository.dart';
import 'package:flutter_generic_app/data/services/index.dart';
import 'package:flutter_generic_app/ui/services/index.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia

  //! Core
  getIt.registerLazySingleton(() => AuthRepository());

  //! External
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPreferences);
    getIt.registerLazySingleton(() => DynamicLinkService());
    getIt.registerLazySingleton(() => ErrorService());
    getIt.registerLazySingleton(() => FirebaseAnalyticsService());
    getIt.registerLazySingleton(() => FirebaseCrashlyticsService());
    getIt.registerLazySingleton(() => FirebasePushNotificationService());
    getIt.registerLazySingleton(() => FirebaseStorageService());


  // UI
  getIt.registerLazySingleton(() => DialogService());
  getIt.registerLazySingleton(() => NavigationService());

}