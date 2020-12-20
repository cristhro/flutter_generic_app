import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_generic_app/locator.dart';
import 'package:flutter_generic_app/services/navigation_service.dart';
import 'package:flutter_generic_app/ui/home/view/home_page.dart';
class PushNotificationService {
 final FirebaseMessaging _fcm = FirebaseMessaging();
  final NavigationService _navigationService = locator<NavigationService>();

  Future initialise() async {
    if (Platform.isIOS) {
      // request permissions if we're on android
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      // Called when the app is in the foreground and we receive a push notification
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
      },
      // Called when the app has been closed comlpetely and it's opened
      // from the push notification.
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _serialiseAndNavigate(message);
      },
      // Called when the app is in the background and it's opened
      // from the push notification.
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _serialiseAndNavigate(message);
      },
    );
  }

  void _serialiseAndNavigate(Map<String, dynamic> message) {
    var notificationData = message['data'];
    var view = notificationData['view'];

    if (view != null) {
      // Navigate to the create post view
      if (view == 'home') {
        _navigationService.navigateTo(HomePage.routeName());
      }
    }
  }
}