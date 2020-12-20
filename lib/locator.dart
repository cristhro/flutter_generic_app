import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_generic_app/services/services.dart';

import 'services/analytics_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPrefs);
  locator.registerSingleton(PreferencesService());
  locator.registerSingleton(AnalyticsService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => PlayerService());
}

class PlayerService {}
