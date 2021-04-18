// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repositories/auth_repository.dart' as _i3;
import '../data/services/auth_service.dart' as _i6;
import '../data/services/dynamic_link_service.dart' as _i7;
import '../data/services/error_service.dart' as _i8;
import '../data/services/firebase_analytics_service.dart' as _i9;
import '../data/services/firebase_push_notification_service.dart' as _i13;
import '../data/services/firebase_remote_config_service.dart' as _i10;
import '../data/services/firebase_storage_service.dart' as _i12;
import '../ui/services/dialog_service.dart' as _i14;
import '../ui/services/navigation_service.dart' as _i15;
import '../ui/services/preferences_service.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthRepository>(() => _i3.AuthRepository(
      firebaseAuth: get<_i4.FirebaseAuth>(),
      googleSignIn: get<_i5.GoogleSignIn>()));
  gh.factory<_i6.AuthService>(() => _i6.AuthService());
  gh.factory<_i7.DynamicLinkService>(() => _i7.DynamicLinkService());
  gh.factory<_i8.ErrorService>(() => _i8.ErrorService());
  gh.factory<_i9.FirebaseAnalyticsService>(
      () => _i9.FirebaseAnalyticsService());
  gh.factory<_i10.FirebaseRemoteConfigService>(() =>
      _i10.FirebaseRemoteConfigService(remoteConfig: get<_i11.RemoteConfig>()));
  gh.factory<_i12.FirebaseStorageService>(() => _i12.FirebaseStorageService());
  gh.factory<_i13.PushNotificationService>(
      () => _i13.PushNotificationService());
  gh.singleton<_i14.DialogService>(_i14.DialogService());
  gh.singleton<_i15.NavigationService>(_i15.NavigationService());
  gh.singleton<_i16.PreferencesService>(_i16.PreferencesService());
  return get;
}
