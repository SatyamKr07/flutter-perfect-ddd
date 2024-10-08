import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perfect_ddd/app_core/errors/app_error.dart';
import 'package:flutter_perfect_ddd/application/my_app/my_app_cubit.dart';
import 'package:flutter_perfect_ddd/presentation/routes/route_names.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/auth/auth_repository.dart';
import '../../domain/models/user/user_model.dart';
import '../../infrastructure/di/injection.dart';
import '../../domain/repositories/user/user_repository.dart';
part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  UserModel? userModel;

  AuthCubit(this._authRepository, this._userRepository)
      : super(const AuthState.initial()) {
    _authRepository.authStateChanges.listen((user) {
      onAuthStateChange(user);
    });
  }

  Future<void> onAuthStateChange(User? user) async {
    if (user != null) {
      // await updateUserModel(firebaseUser: user, userRole: UserRole.user);
      UserModel? userModel = await getUserFromDB(id: user.uid);
      if (userModel == null) {
        UserModel? userFromDB = await createUserInDB(firebaseUser: user);
        if (userFromDB != null) {
          routeBasedOnRole(UserRole.user);
          emit(AuthState.authenticated(user));
        }
      } else {
        routeBasedOnRole(UserRole.user);
        emit(AuthState.authenticated(user));
      }
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
    failureOrUser.fold(
      (failure) => emit(AuthState.failure(failure)),
      (user) async {
        emit(AuthState.authenticated(user));
      },
    );
  }

  Future<void> signInAsGuest() async {
    emit(const AuthState.authenticating());
    final result = await _authRepository.signInAnonymously();
    emit(
      result.fold(
        (failure) => AuthState.failure(failure),
        (user) {
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
          return AuthState.authenticated(user);
        },
      ),
    );
  }

  Future<UserModel> updateUserModel(
      {required User firebaseUser, required UserRole userRole}) async {
    UserModel userModel = UserModel(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName ?? '',
      photoUrl: firebaseUser.photoURL ?? '',
      role: userRole,
    );
    final updatedUserModel = await _userRepository.updateUser(userModel);
    return updatedUserModel.fold(
      (failure) {
        emit(AuthState.failure(failure));
        throw failure; // Re-throw to maintain Future<UserModel> return type
      },
      (user) {
        getIt<MyAppCubit>().updateUserModel(user);
        return user;
      },
    );
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(const AuthState.unauthenticated());
  }

  Future<UserModel?> getUserFromDB({required String id}) async {
    final result = await _userRepository.getUserById(id);
    return result.fold(
      (error) => null,
      (userModel) {
        if (userModel != null) {
          this.userModel = userModel;
          getIt<MyAppCubit>().updateUserModel(userModel);
        }
        return userModel;
      },
    );
  }

  Future<UserModel?> createUserInDB({required User firebaseUser}) async {
    UserModel newUser = UserModel(
      id: firebaseUser.uid,
      email: firebaseUser.email ?? '',
      name: firebaseUser.displayName ?? '',
      photoUrl: firebaseUser.photoURL ?? '',
      role: UserRole.user,
    );
    final result = await _userRepository.createUser(newUser);
    return result.fold(
      (failure) {
        return null;
      },
      (user) {
        getIt<MyAppCubit>().updateUserModel(user);
        return user;
      },
    );
  }
}
