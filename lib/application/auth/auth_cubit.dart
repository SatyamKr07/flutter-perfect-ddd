import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perfect_ddd/domain/core/errors/app_error.dart';
import 'package:flutter_perfect_ddd/application/my_app/my_app_cubit.dart';
import 'package:flutter_perfect_ddd/presentation/routes/route_names.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/auth/auth_failure.dart';
import '../../domain/repositories/auth/auth_repository.dart';
import '../../domain/models/user/user_model.dart';
import '../../domain/core/di/injection.dart';
part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  UserModel? userModel;

  AuthCubit(this._authRepository) : super(const AuthState.initial()) {
    _authRepository.authStateChanges.listen((user) {
      checkAuthState(user);
    });
  }

  Future<void> checkAuthState(User? user) async {
    if (user != null) {
      updateUserModel(firebaseUser: user, userRole: UserRole.user);
      routeBasedOnRole(UserRole.user);
      emit(AuthState.authenticated(user));
    } else {
      getIt<MyAppCubit>().clearUser();
      getIt<GoRouter>().go(RouteNames.signInPage);
      emit(const AuthState.unauthenticated());
    }
  }

  void routeBasedOnRole(userRole) {
    switch (userRole) {
      case UserRole.user:
        getIt<GoRouter>().go(RouteNames.myBottomNavBarPage);
        break;
      case UserRole.guest:
        getIt<GoRouter>().go(RouteNames.myBottomNavBarPage);
        break;
      case UserRole.admin:
        getIt<GoRouter>().go(RouteNames.myBottomNavBarPage);
        break;
    }
  }

  Future<void> signInWithGoogle() async {
    emit(const AuthState.authenticating());
    final failureOrUser = await _authRepository.signInWithGoogle();

    emit(
      failureOrUser.fold(
        (failure) => AuthState.failure(failure),
        (user) {
          updateUserModel(firebaseUser: user, userRole: UserRole.user);
          routeBasedOnRole(UserRole.user);
          return AuthState.authenticated(user);
        },
      ),
    );
  }

  Future<void> signInAsGuest() async {
    emit(const AuthState.authenticating());
    final result = await _authRepository.signInAnonymously();
    emit(
      result.fold(
        (failure) => AuthState.failure(failure),
        (user) {
          updateUserModel(firebaseUser: user, userRole: UserRole.admin);
          routeBasedOnRole(UserRole.guest);
          return AuthState.authenticated(user);
        },
      ),
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(const AuthState.authenticating());
    final result =
        await _authRepository.signInWithEmailAndPassword(email, password);
    emit(
      result.fold(
        (failure) => AuthState.failure(failure),
        (user) {
          updateUserModel(firebaseUser: user, userRole: UserRole.admin);
          routeBasedOnRole(UserRole.admin);
          return AuthState.authenticated(user);
        },
      ),
    );
  }

  UserModel updateUserModel(
      {required User firebaseUser, required UserRole userRole}) {
    userModel = UserModel(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName ?? '',
      photoUrl: firebaseUser.photoURL ?? '',
      role: userRole, // Default role
    );
    getIt<MyAppCubit>().updateUserModel(userModel!);
    return userModel!;
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(const AuthState.unauthenticated());
  }
}
