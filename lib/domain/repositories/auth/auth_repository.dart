import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_perfect_ddd/domain/core/errors/app_error.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<AppError, User>> signInWithGoogle();
  Future<void> signOut();
  Stream<User?> get authStateChanges;
  Future<Either<AppError, User>> signInAnonymously();
  Future<Either<AppError, User>> signInWithEmailAndPassword(
      String email, String password);
}
