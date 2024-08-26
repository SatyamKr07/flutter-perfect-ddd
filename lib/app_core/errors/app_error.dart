import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../application/my_app/my_app_cubit.dart';
import '../../env.dart';
import '../../infrastructure/di/injection.dart';
import '../../infrastructure/services/my_logger/my_logger.dart';

class AppError {
  final String message;
  final String? code;

  // Private constructor
  AppError._(this.message, {this.code}) {
    // _showErrorSnachbar();
    getIt<MyAppCubit>().addAppError(AppError._emitError(message, code: code));
    logger.e(message);
  }

  AppError._emitError(this.message, {this.code});

  void _showErrorSnachbar() {
    if (Env.isDev) {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  // Factory method for general errors
  factory AppError.general(String message, {String? code}) {
    final error = AppError._(message, code: code);
    return error;
  }

  static AppError responseError(Response response) {
    final error = switch (response.statusCode) {
      401 => AppError._('Unauthorized', code: 'E401'),
      404 => AppError._('Not Found', code: 'E404'),
      _ => AppError._('Server Error', code: 'E500'),
    };
    return error;
  }

  static AppError dioError(DioException error) {
    final appError = switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        AppError._('Network Timeout', code: 'E001'),
      DioExceptionType.badResponse => responseError(error.response!),
      DioExceptionType.cancel => AppError._('Request Cancelled', code: 'E002'),
      DioExceptionType.unknown => AppError._('Unknown Dio Error', code: 'E003'),
      DioExceptionType.badCertificate =>
        AppError._('Bad Certificate', code: 'E004'),
      DioExceptionType.connectionError =>
        AppError._('Connection Error', code: 'E005'),
    };
    return appError;
  }

  static AppError networkError(dynamic error) {
    return AppError._('Network Error', code: 'E006');
  }

  static AppError catchError(String error, {String? code}) {
    return AppError._('Catch Error: $error', code: code);
  }

  static AppError cancelledByUser() {
    return AppError._('Sign in cancelled by user', code: 'E008');
  }

  static AppError firebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return AppError._(
            'An account already exists with the same email address but different sign-in credentials.',
            code: '${e.code}\n${e.message}');
      case 'invalid-credential':
        return AppError._('The credential is malformed or has expired.',
            code: '${e.code}\n${e.message}');
      case 'operation-not-allowed':
        return AppError._('Google sign-in is not enabled for this project.',
            code: '${e.code}\n${e.message}');
      case 'user-disabled':
        return AppError._('The user account has been disabled.',
            code: '${e.code}\n${e.message}');
      case 'user-not-found':
        return AppError._('No user found for that email.',
            code: '${e.code}\n${e.message}');
      case 'wrong-password':
        return AppError._('Wrong password provided for that user.',
            code: '${e.code}\n${e.message}');
      case 'invalid-verification-code':
        return AppError._(
            'The credential verification code received is invalid.',
            code: '${e.code}\n${e.message}');
      case 'invalid-verification-id':
        return AppError._('The credential verification ID received is invalid.',
            code: '${e.code}\n${e.message}');
      default:
        return AppError._('An unknown error occurred',
            code: '${e.code}\n${e.message}');
    }
  }
}
