import 'dart:developer' as developer;

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_generic_app/domain/services/index.dart';

class FirebaseRemoteConfigService implements IRemoteConfigService {
  final RemoteConfig _remoteConfig;

  static FirebaseRemoteConfigService? _instance;
  static Future<FirebaseRemoteConfigService?> getInstance() async {
    // ignore: prefer_conditional_assignment
    if (_instance == null) {
      _instance = FirebaseRemoteConfigService(
        remoteConfig: RemoteConfig.instance,
      );
    }

    return _instance;
  }

  FirebaseRemoteConfigService({required RemoteConfig remoteConfig}) : _remoteConfig = remoteConfig;

  @override
  bool get showMainBanner => _remoteConfig.getBool(RemoteConfigConsts.showMainBanner);

  @override
  Future initialise() async {
    try {
      await _remoteConfig.setDefaults(RemoteConfigConsts.defaults);
      await _fetchAndActivate();
    } catch (e) {
      developer.log('Unable to fetch remote config. Cached or default values will be used');
    }
  }

  Future _fetchAndActivate() async {
    await _remoteConfig.fetch();
    await _remoteConfig.activate();
  }
}
