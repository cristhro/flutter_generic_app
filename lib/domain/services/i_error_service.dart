
abstract class IErrorService {
  Future<void> reportError(dynamic error, dynamic stackTrace);
}
