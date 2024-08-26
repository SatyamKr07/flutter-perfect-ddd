import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_perfect_ddd/app_core/my_enums/my_enums.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../application/my_app/my_app_cubit.dart';
import '../../env.dart';
import '../../infrastructure/di/injection.dart';
import '../../infrastructure/services/my_logger/my_logger.dart';

class AppError {
  final String message;
  final String? code;
  final StackTrace? stackTrace;

  // Private constructor
  AppError._(this.message, {this.code, this.stackTrace}) {
    _showErrorSnachbar();
    logger.e(message, stackTrace: stackTrace);
    if (Env.isDev) {
      getIt<MyAppCubit>().addAppError(
          AppError._emitError(message, code: code, stackTrace: stackTrace));
    } else if (Env.getEnv == EnumEnv.prod) {
      getIt<MyAppCubit>().addErrorToCrashlytics(
          AppError._emitError(message, code: code, stackTrace: stackTrace));
    }
  }

  // Private constructor
  AppError._emitError(this.message, {this.code, this.stackTrace});

  void _showErrorSnachbar() {
    if (Env.isDev) {
      Fluttertoast.showToast(
          msg: "$code\n$message",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  // Factory method for general errors
  factory AppError.general(String message,
      {String? code, StackTrace? stackTrace}) {
    final error = AppError._(message, code: code, stackTrace: stackTrace);
    return error;
  }

  static AppError responseError(Response response, {StackTrace? stackTrace}) {
    final error = switch (response.statusCode) {
      401 || 404 || 500 => AppError._(response.statusMessage ?? '',
          code: response.statusCode.toString(), stackTrace: stackTrace),
      _ => AppError._('Default Response Error: ${response.statusMessage}',
          code: response.statusCode.toString(), stackTrace: stackTrace),
    };
    return error;
  }

  static AppError dioError(DioException error, {StackTrace? stackTrace}) {
    // final appError = switch (error.type) {
    //   DioExceptionType.connectionTimeout ||
    //   DioExceptionType.sendTimeout ||
    //   DioExceptionType.receiveTimeout =>
    //     AppError._('Network Timeout', code: 'E001', stackTrace: stackTrace),
    //   DioExceptionType.badResponse =>
    //     responseError(error.response!, stackTrace: stackTrace),
    //   DioExceptionType.cancel =>
    //     AppError._('Request Cancelled', code: 'E002', stackTrace: stackTrace),
    //   DioExceptionType.unknown =>
    //     AppError._('Unknown Dio Error', code: 'E003', stackTrace: stackTrace),
    //   DioExceptionType.badCertificate =>
    //     AppError._('Bad Certificate', code: 'E004', stackTrace: stackTrace),
    //   DioExceptionType.connectionError =>
    //     AppError._('Connection Error', code: 'E005', stackTrace: stackTrace),
    // };
    final appError = AppError._(error.toString());
    return appError;
  }

  static AppError networkError(dynamic error, {StackTrace? stackTrace}) {
    return AppError._('Network Error', code: 'E006', stackTrace: stackTrace);
  }

  static AppError catchError(String error,
      {String? code, StackTrace? stackTrace}) {
    return AppError._('Catch Error: $error',
        code: code, stackTrace: stackTrace);
  }

  static AppError cancelledByUser({StackTrace? stackTrace}) {
    return AppError._('Sign in cancelled by user',
        code: 'E008', stackTrace: stackTrace);
  }

  static AppError firebaseAuthError(FirebaseAuthException e,
      {StackTrace? stackTrace}) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return AppError._(
            'An account already exists with the same email address but different sign-in credentials.',
            code: '${e.code}\n${e.message}',
            stackTrace: stackTrace);
      case 'invalid-credential':
        return AppError._('The credential is malformed or has expired.',
            code: '${e.code}\n${e.message}', stackTrace: stackTrace);
      case 'operation-not-allowed':
        return AppError._('Google sign-in is not enabled for this project.',
            code: '${e.code}\n${e.message}', stackTrace: stackTrace);
      case 'user-disabled':
        return AppError._('The user account has been disabled.',
            code: '${e.code}\n${e.message}', stackTrace: stackTrace);
      case 'user-not-found':
        return AppError._('No user found for that email.',
            code: '${e.code}\n${e.message}', stackTrace: stackTrace);
      case 'wrong-password':
        return AppError._('Wrong password provided for that user.',
            code: '${e.code}\n${e.message}', stackTrace: stackTrace);
      case 'invalid-verification-code':
        return AppError._(
            'The credential verification code received is invalid.',
            code: '${e.code}\n${e.message}',
            stackTrace: stackTrace);
      case 'invalid-verification-id':
        return AppError._('The credential verification ID received is invalid.',
            code: '${e.code}\n${e.message}', stackTrace: stackTrace);
      default:
        return AppError._('An unknown error occurred',
            code: '${e.code}\n${e.message}', stackTrace: stackTrace);
    }
  }
}
