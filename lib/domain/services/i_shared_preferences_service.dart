import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefKeys {
  SharedPrefKeys._();
  static const String languageCode = 'languageCode';
}

abstract class ISharedPreferencesService {
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
