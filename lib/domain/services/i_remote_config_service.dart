
mixin RemoteConfigConsts {
  static String showMainBanner = "show_main_banner";
  static Map<String, dynamic> defaults = <String, dynamic>{
    RemoteConfigConsts.showMainBanner: false,
  };
}

abstract class IRemoteConfigService {
  bool get showMainBanner;
  Future initialise();
}
