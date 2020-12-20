import 'package:flutter_generic_app/services/remote_config_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_generic_app/services/services.dart';

import 'services/analytics_service.dart';
import 'services/push_notification_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPrefs);
  locator.registerSingleton(PreferencesService());
  locator.registerSingleton(AnalyticsService()); 
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => CloudStorageService()); 
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => ErrorService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => PushNotificationService()); 
  locator.registerLazySingleton(() => DynamicLinkService()); 
  // locator.registerSingleton(await RemoteConfigService.getInstance()); // TODO:###
}
