import 'package:injectable/injectable.dart';

@injectable
abstract class IPushNotificationService {
  Future initialise();

  String serialiseToView(Map<String, dynamic> message);
}


