import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../_core/errors/app_error_handler.dart';
import '../../domain/repositories/auth/auth_repository.dart';
import '../../_core/errors/app_error.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Stream<User?> get authStateChanges =>
      FirebaseAuth.instance.authStateChanges();

  @override
  Future<Either<AppError, User>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(AppErrorHandler.cancelledByUser());
      }
      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      try {
        final userCredential =
            await _firebaseAuth.signInWithCredential(authCredential);
        return right(userCredential.user!);
      } on FirebaseAuthException catch (e) {
        return left(AppErrorHandler.handleFirebaseAuthError(e));
      }
    } on Exception catch (e) {
      return left(AppErrorHandler.handleUnknownError(e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    await Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  @override
  Future<Either<AppError, User>> signInAnonymously() async {
    try {
      final userCredential = await _firebaseAuth.signInAnonymously();
      return right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return left(AppErrorHandler.handleFirebaseAuthError(e));
    } catch (e) {
      return left(AppErrorHandler.handleUnknownError(e.toString()));
    }
  }

  @override
  Future<Either<AppError, User>> signInWithEmailAndPassword(
      String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }
}
