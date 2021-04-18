import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter_generic_app/domain/services/index.dart';

class FirebaseAnalyticsService implements IAnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() => FirebaseAnalyticsObserver(analytics: _analytics);

  // User properties tells us what the user is
  @override
  Future setUserProperties({required String userId, required String userRole}) async {
    await _analytics.setUserId(userId);
    await _analytics.setUserProperty(name: 'user_role', value: userRole);
    // property to indicate if it's a pro paying member
    // property that might tell us it's a regular poster, etc
  }

  @override
  void track(String event) {
    _analytics.logEvent(name: event);
  }

  @override
  Future logLogin() async {
    await _analytics.logLogin(loginMethod: 'email');
  }

  @override
  Future logSignUp() async {
    await _analytics.logSignUp(signUpMethod: 'email');
  }

  @override
  Future logPostCreated({bool hasImage = false}) async {
    await _analytics.logEvent(
      name: 'create_post',
      parameters: {'has_image': hasImage},
    );
  }
}
