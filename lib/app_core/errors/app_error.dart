import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../infrastructure/services/my_logger/my_logger.dart';

class AppError {
  final String message;
  final String? code;

  AppError(this.message, {this.code});
}

