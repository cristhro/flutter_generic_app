import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_generic_app/di/injection.dart';
import 'package:flutter_generic_app/domain/services/index.dart';
import 'package:flutter_generic_app/ui/pages/home/home_page.dart';
import 'package:flutter_generic_app/ui/services/index.dart';

class PushNotificationService implements IPushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final NavigationService _navigationService = getIt<NavigationService>();

  @override
  Future initialise() async {
    _fcm.requestPermission();
    _fcm.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
    /*if (Platform.isIOS) {
      // request permissions if we're on android
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      // Called when the app is in the foreground and we receive a push notification
      onMessage: (Map<String, dynamic> message) async {
        developer.log('onMessage: $message');
      },
      // Called when the app has been closed comlpetely and it's opened
      // from the push notification.
      onLaunch: (Map<String, dynamic> message) async {
        developer.log('onLaunch: $message');
        _serialiseAndNavigate(message);
      },
      // Called when the app is in the background and it's opened
      // from the push notification.
      onResume: (Map<String, dynamic> message) async {
        developer.log('onResume: $message');
        _serialiseAndNavigate(message);
      },
    );
    */
  }

  @override
  String serialiseToView(Map<String, dynamic> message) {
    try {
      final notificationData = message['data'];
      final String view = notificationData['view'] as String;
      return view;
    } catch (error) {
      return '';
    }
  }

  void serialiseAndNavigate(Map<String, dynamic> message) {
    final String view = serialiseToView(message);

    if (view.isNotEmpty) {
      if (view == 'home') {
        _navigationService.navigateTo(HomePage.routeName());
      }
    }
  }
}
