import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../0_core/services/my_logger.dart';

class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, {this.code});
}

class ErrorHandler {
  static AppException handleError(Response response) {
    logger.e(response);
    switch (response.statusCode) {
      case 401:
        return AppException('Unauthorized', code: 'E401');
      case 404:
        return AppException('Not Found', code: 'E404');
      default:
        return AppException('Server Error', code: 'E500');
    }
  }

  static AppException handleDioError(DioException error) {
    logger.e(error);
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppException('Network Timeout', code: 'E001');
      case DioExceptionType.badResponse:
        return handleError(error.response!);
      case DioExceptionType.cancel:
        return AppException('Request Cancelled', code: 'E002');
      case DioExceptionType.unknown:
        return AppException('Unknown Dio Error', code: 'E003');
      case DioExceptionType.badCertificate:
        return AppException('Bad Certificate', code: 'E004');
      case DioExceptionType.connectionError:
        return AppException('Connection Error', code: 'E005');
    }
  }

  static AppException handleNetworkError(dynamic error) {
    logger.e(error);
    return AppException('Network Error', code: 'E006');
  }

  static AppException handleUnknownError(String error) {
    logger.e(error);
    return AppException('Unknown Error: $error', code: 'E007');
  }

  static AppException cancelledByUser() {
    logger.e("cancelledByUser");
    return AppException('Sign in cancelled by user', code: 'E008');
  }

  static AppException handleFirebaseAuthError(FirebaseAuthException e) {
    logger.e(e);
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return AppException(
            'An account already exists with the same email address but different sign-in credentials.');
      case 'invalid-credential':
        return AppException('The credential is malformed or has expired.');
      case 'operation-not-allowed':
        return AppException('Google sign-in is not enabled for this project.');
      case 'user-disabled':
        return AppException('The user account has been disabled.');
      case 'user-not-found':
        return AppException('No user found for that email.');
      case 'wrong-password':
        return AppException('Wrong password provided for that user.');
      case 'invalid-verification-code':
        return AppException(
            'The credential verification code received is invalid.');
      case 'invalid-verification-id':
        return AppException(
            'The credential verification ID received is invalid.');
      default:
        return AppException('An unknown error occurred: ${e.message}');
    }
  }
}
