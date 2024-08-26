abstract class ErrorReportingRepository {
  Future<void> reportError(dynamic exception, StackTrace? stack);
  Future<void> logMessage(String message);
  Future<void> setCustomData(String key, dynamic value);
}
