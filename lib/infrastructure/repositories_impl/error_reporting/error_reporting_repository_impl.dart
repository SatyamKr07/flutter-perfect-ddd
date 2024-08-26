import 'package:flutter_perfect_ddd/domain/repositories/error_reporting/error_reporting_repository.dart';
import 'package:flutter_perfect_ddd/infrastructure/datasources/firebase/firebase_crashlytics_datasource.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ErrorReportingRepository)
class ErrorReportingRepositoryImpl implements ErrorReportingRepository {
  final FirebaseCrashlyticsDatasource _crashlyticsDatasource;

  ErrorReportingRepositoryImpl(this._crashlyticsDatasource);

  @override
  Future<void> reportError(dynamic exception, StackTrace? stack) async {
    await _crashlyticsDatasource.recordError(exception, stack);
  }

  @override
  Future<void> logMessage(String message) async {
    await _crashlyticsDatasource.log(message);
  }

  @override
  Future<void> setCustomData(String key, dynamic value) async {
    await _crashlyticsDatasource.setCustomKey(key, value);
  }
}