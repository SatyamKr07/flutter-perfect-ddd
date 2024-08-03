import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

abstract class IAuthRepository {
  Future<Either<Exception, User>> signInWithGoogle();
  Future<void> signOut();
  Stream<User?> get authStateChanges;
}
