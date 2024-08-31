import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseCrashlyticsDatasource {
  final FirebaseCrashlytics _crashlytics;

  FirebaseCrashlyticsDatasource(this._crashlytics);

  Future<void> recordError(dynamic exception, StackTrace? stack) async {
    await _crashlytics.recordError(exception, stack);
  }

  Future<void> log(String message) async {
    await _crashlytics.log(message);
  }

  Future<void> setCustomKey(String key, dynamic value) async {
    await _crashlytics.setCustomKey(key, value);
  }
}