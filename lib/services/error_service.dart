class ErrorService {
  Future<void> reportError(dynamic error, dynamic stackTrace) {
    print('Error: $error');
  }
}
