
import 'package:injectable/injectable.dart';

mixin RemoteConfigConsts {
  static String showMainBanner = "show_main_banner";
  static Map<String, dynamic> defaults = <String, dynamic>{
    RemoteConfigConsts.showMainBanner: false,
  };
}

@module
abstract class IRemoteConfigService {
  bool get showMainBanner;
  @preResolve
  Future initialise();
}
