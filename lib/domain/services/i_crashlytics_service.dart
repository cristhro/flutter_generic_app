import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
abstract class ICrashlyticsService {
  Future<void> recordFlutterError(FlutterErrorDetails flutterErrorDetails);
}
