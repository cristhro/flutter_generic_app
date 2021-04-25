
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_generic_app/domain/services/i_crashlytics_service.dart';

class FirebaseCrashlyticsService implements ICrashlyticsService {
  @override
  Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails) async {
    FirebaseCrashlytics.instance.recordFlutterError(flutterErrorDetails);
  }
}
