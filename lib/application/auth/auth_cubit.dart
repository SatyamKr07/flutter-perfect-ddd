import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perfect_ddd/_core/errors/app_error.dart';
import 'package:flutter_perfect_ddd/application/my_app/my_app_cubit.dart';
import 'package:flutter_perfect_ddd/_route/route_names.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import '../../domain/i_repositories/auth/auth_failure.dart';
import '../../domain/i_repositories/auth/i_auth_repository.dart';
import '../../domain/models/user/user_model.dart';
import '../../_di/injection.dart';
part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthState.initial()) {
    _authRepository.authStateChanges.listen((user) {
      if (user != null) {
        updateUserModel(user);
        getIt<GoRouter>().go(RouteNames.myBottomNavBarPage);
        emit(AuthState.authenticated(user));
      } else {
        getIt<MyAppCubit>().clearUser();
        getIt<GoRouter>().go(RouteNames.signInPage);
        emit(const AuthState.unauthenticated());
      }
    });
  }

  Future<void> signInWithGoogle() async {
    emit(const AuthState.authenticating());
    final failureOrUser = await _authRepository.signInWithGoogle();

    emit(
      failureOrUser.fold(
        (failure) => AuthState.failure(failure),
        (user) {
          return AuthState.authenticated(user);
        },
      ),
    );
  }

  UserModel updateUserModel(User user) {
    UserModel userModel = UserModel(
      id: user.uid,
      email: user.email!,
      name: user.displayName ?? '',
      photoUrl: user.photoURL ?? '',
    );
    getIt<MyAppCubit>().updateUserModel(userModel);
    return userModel;
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(const AuthState.unauthenticated());
  }
}
