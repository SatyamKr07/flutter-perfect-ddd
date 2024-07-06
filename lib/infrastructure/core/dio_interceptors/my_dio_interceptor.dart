import 'package:dio/dio.dart';
import '../../../env.dart';
import '../my_enums/my_enums.dart';
import '../services/my_logger.dart';

class MyDioInterceptor {
  static Dio getDio({Map<ResponseEnum, bool>? loggingOptions}) {
    final dio = Dio(BaseOptions(baseUrl: Env.baseUrl));

    // Determine logging options based on environment
    final effectiveLoggingOptions =
        _getLoggingOptionsForEnvironment(loggingOptions);

    // Add Firebase authentication token interceptor
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Get Firebase authentication token
        // final FirebaseAuth auth = FirebaseAuth.instance;
        // final User? user = auth.currentUser;
        // if (user != null) {
        //   final String token = await user.getIdToken();
        //   options.headers['Authorization'] = 'Bearer $token';
        // }

        // Log request if enabled
        if (effectiveLoggingOptions.containsKey(ResponseEnum.request) &&
            effectiveLoggingOptions[ResponseEnum.request]!) {
          _logRequest(options);
        }

        handler.next(options);
      },
      onResponse: (response, handler) {
        // Log response if enabled
        if (effectiveLoggingOptions.containsKey(ResponseEnum.response) &&
            effectiveLoggingOptions[ResponseEnum.response]!) {
          _logResponse(response);
        }
        handler.next(response);
      },
      onError: (DioException error, handler) {
        // Log error if enabled
        if (effectiveLoggingOptions.containsKey(ResponseEnum.error) &&
            effectiveLoggingOptions[ResponseEnum.error]!) {
          _logError(error);
        }
        handler.next(error);
      },
    ));

    return dio;
  }

  static void _logRequest(RequestOptions options) {
    logger.d(
        '[REQUEST] => PATH: ${options.path} - ${options.extra['fileName']} (${options.extra['lineNumber']})');
    logger.d('[REQUEST] => METHOD: ${options.method}');
    logger.d('[REQUEST] => HEADERS: ${options.headers}');
    logger.d('[REQUEST] => DATA: ${options.data}');
  }

  static void _logResponse(Response response) {
    logger.d(
        '[RESPONSE] => PATH: ${response.requestOptions.path} - ${response.requestOptions.extra['fileName']} (${response.requestOptions.extra['lineNumber']})');
    logger.d('[RESPONSE] => STATUS: ${response.statusCode}');
    logger.d('[RESPONSE] => DATA: ${response.data}');
  }

  static void _logError(DioException error) {
    logger.e(
        '[ERROR] => PATH: ${error.requestOptions.path} - ${error.requestOptions.extra['fileName']} (${error.requestOptions.extra['lineNumber']})');
    logger.e('[ERROR] => MESSAGE: ${error.message}');
    logger.e('[ERROR] => DATA: ${error.response?.data}');
  }

  static Map<ResponseEnum, bool> _getLoggingOptionsForEnvironment(
      Map<ResponseEnum, bool>? loggingOptions) {
    switch (Env.getEnv) {
      case EnvironmentEnum.dev:
        return loggingOptions ??
            {
              ResponseEnum.request: true,
              ResponseEnum.response: true,
              ResponseEnum.error: true,
            };
      case EnvironmentEnum.uat:
      case EnvironmentEnum.prod:
        return {};
      default:
        return {};
    }
  }
}
