import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../infrastructure/services/my_logger/my_logger.dart';
import 'app_error.dart';

class AppErrorHandler {
  static AppError handleError(Response response) {
    logger.e(response);
    switch (response.statusCode) {
      case 401:
        return AppError('Unauthorized', code: 'E401');
      case 404:
        return AppError('Not Found', code: 'E404');
      default:
        return AppError('Server Error', code: 'E500');
    }
  }

  static AppError handleDioError(DioException error) {
    logger.e(error);
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppError('Network Timeout', code: 'E001');
      case DioExceptionType.badResponse:
        return handleError(error.response!);
      case DioExceptionType.cancel:
        return AppError('Request Cancelled', code: 'E002');
      case DioExceptionType.unknown:
        return AppError('Unknown Dio Error', code: 'E003');
      case DioExceptionType.badCertificate:
        return AppError('Bad Certificate', code: 'E004');
      case DioExceptionType.connectionError:
        return AppError('Connection Error', code: 'E005');
    }
  }

  static AppError handleNetworkError(dynamic error) {
    logger.e(error);
    return AppError('Network Error', code: 'E006');
  }

  static AppError handleUnknownError(String error) {
    logger.e(error);
    return AppError('Unknown Error: $error', code: 'E007');
  }

  static AppError cancelledByUser() {
    logger.e("cancelledByUser");
    return AppError('Sign in cancelled by user', code: 'E008');
  }

  static AppError handleFirebaseAuthError(FirebaseAuthException e) {
    logger.e(e);
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return AppError(
            'An account already exists with the same email address but different sign-in credentials.',
            code: '${e.code}\n${e.message}');
      case 'invalid-credential':
        return AppError('The credential is malformed or has expired.',
            code: '${e.code}\n${e.message}');
      case 'operation-not-allowed':
        return AppError('Google sign-in is not enabled for this project.',
            code: '${e.code}\n${e.message}');
      case 'user-disabled':
        return AppError('The user account has been disabled.',
            code: '${e.code}\n${e.message}');
      case 'user-not-found':
        return AppError('No user found for that email.',
            code: '${e.code}\n${e.message}');
      case 'wrong-password':
        return AppError('Wrong password provided for that user.',
            code: '${e.code}\n${e.message}');
      case 'invalid-verification-code':
        return AppError('The credential verification code received is invalid.',
            code: '${e.code}\n${e.message}');
      case 'invalid-verification-id':
        return AppError('The credential verification ID received is invalid.',
            code: '${e.code}\n${e.message}');
      default:
        return AppError('An unknown error occurred',
            code: '${e.code}\n${e.message}');
    }
  }
}
