abstract class IPushNotificationService {
  Future initialise();

  String serialiseToView(Map<String, dynamic> message);
}


