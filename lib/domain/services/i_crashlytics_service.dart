import 'package:flutter/material.dart';

abstract class ICrashlyticsService {
  Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails);
}
