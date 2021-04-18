
mixin Events {
  static String appOnDetached = 'appDetached';
  static String appOnResumed = 'appOnResume';
  static String appOnInactive = 'appInactive';
  static String appOnPaused = 'appPaused';
}
abstract class IAnalyticsService {
  // User properties tells us what the user is
  Future setUserProperties({required String userId, required String userRole});
  void track(String event);
  Future logLogin();
  Future logSignUp();
  Future logPostCreated({bool hasImage = false});
}
