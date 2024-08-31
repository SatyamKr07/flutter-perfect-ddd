import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_perfect_ddd/infrastructure/services/my_logger/my_logger.dart';
import 'package:stack_trace/stack_trace.dart';

class MyDioInterceptor extends Interceptor {
  final _crashlytics = FirebaseCrashlytics.instance;
  final firebaseAuth = FirebaseAuth.instance;
  String userEmail = '';

  MyDioInterceptor() {
    userEmail = firebaseAuth.currentUser?.email ?? 'no email';
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final stackTrace = Chain.current().terse;
    final message =
        'Request: ${options.method} ${options.uri} - Data: ${options.data}';
    _logRequest(
      message: message,
      stackTrace: stackTrace,
      key: 'dio_request',
      options: options,
    );
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final stackTrace = Chain.current().terse;
    _logResponse(
      response: response,
      stackTrace: stackTrace,
      key: 'dio_response',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final stackTrace = Chain.current().terse;
    _logError(
      error: err,
      stackTrace: stackTrace,
      key: 'dio_error',
    );
    super.onError(err, handler);
  }

  void _logRequest({
    required String message,
    required StackTrace stackTrace,
    required String key,
    required RequestOptions options,
  }) {
    try {
      final dateTime = DateTime.now().toIso8601String();
      final logMessage = message;

      // Set custom keys
      _crashlytics.setCustomKey('user_email', userEmail);
      _crashlytics.setCustomKey('date_time', dateTime);
      // _crashlytics.setCustomKey('http_method', options.method);
      // _crashlytics.setCustomKey('request_url', options.uri.toString());
      // _crashlytics.setCustomKey('request_headers', options.headers.toString());
      // _crashlytics.setCustomKey('request_data', options.data.toString());

      _crashlytics
          .recordError(logMessage, stackTrace, reason: key, information: [
        'User Email: $userEmail',
        'DateTime: $dateTime',
        'HTTP Method: ${options.method}',
        'Request URL: ${options.uri}',
        'Request Headers: ${options.headers}',
        'Request Data: ${options.data}',
      ]);
      _crashlytics.log(logMessage);
      _crashlytics.sendUnsentReports();
    } catch (e) {
      logger.e("MyDioInterceptor error in _logRequest: $e");
    }
  }

  void _logResponse({
    required Response response,
    required StackTrace stackTrace,
    required String key,
  }) {
    final dateTime = DateTime.now().toIso8601String();
    final message =
        'API Response: ${response.requestOptions.method} ${response.requestOptions.path} - Status: ${response.statusCode}';

    _crashlytics.setCustomKey('user_email', userEmail);
    _crashlytics.setCustomKey('date_time', dateTime);
    // _crashlytics.setCustomKey(
    //     'response_status', response.statusCode.toString());
    // _crashlytics.setCustomKey('response_data', response.data.toString());

    logger.d(message);
    _crashlytics.recordError(message, stackTrace, reason: key, information: [
      'User Email: $userEmail',
      'DateTime: $dateTime',
      'Response Status: ${response.statusCode}',
      'Response Data: ${response.data}',
    ]);
    _crashlytics.log(message);
    _crashlytics.sendUnsentReports();
  }

  void _logError({
    required DioException error,
    required StackTrace? stackTrace,
    required String key,
  }) {
    final dateTime = DateTime.now().toIso8601String();
    final message =
        'API Error: ${error.requestOptions.method} ${error.requestOptions.path} - ${error.message}';

    _crashlytics.setCustomKey('user_email', userEmail);
    _crashlytics.setCustomKey('date_time', dateTime);
    // _crashlytics.setCustomKey('error_type', error.type.toString());
    // _crashlytics.setCustomKey('error_message', error.message ?? 'No message');

    logger.d(message);
    _crashlytics
        .recordError(error, stackTrace, reason: key, fatal: true, information: [
      'User Email: $userEmail',
      'DateTime: $dateTime',
      'Error Type: ${error.type}',
      'Error Message: ${error.message}',
      'Request Method: ${error.requestOptions.method}',
      'Request Path: ${error.requestOptions.path}',
    ]);
    _crashlytics.log(message);
    _crashlytics.sendUnsentReports();
  }
}
