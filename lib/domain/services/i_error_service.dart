import 'package:injectable/injectable.dart';

@injectable
abstract class IErrorService {
  Future<void> reportError(dynamic error, dynamic stackTrace);
}
