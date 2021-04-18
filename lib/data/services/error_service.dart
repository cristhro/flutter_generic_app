import 'dart:developer' as developer;

import 'package:flutter_generic_app/domain/services/i_error_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class ErrorService implements IErrorService {
  @override
  Future<void> reportError(dynamic error, dynamic stackTrace) async {
    developer.log('Error: $error');
  }
}
