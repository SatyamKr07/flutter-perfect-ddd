import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_perfect_ddd/_core/errors/error_handler.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAuthRepository {
  Future<Either<AppException, User>> signInWithGoogle();
  Future<void> signOut();
  Stream<User?> get authStateChanges;
}
