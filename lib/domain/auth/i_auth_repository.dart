import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import 'auth_failure.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, User>> signInWithGoogle();
  Future<void> signOut();
  Stream<User?> get authStateChanges;
}
