import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../app_core/errors/app_error.dart';
import '../../domain/models/user/user_model.dart';
import '../../domain/repositories/error_reporting/error_reporting_repository.dart';
import 'my_app_state.dart';

@lazySingleton
class MyAppCubit extends Cubit<MyAppState> {
  final ErrorReportingRepository _errorReportingRepository;

  MyAppCubit(this._errorReportingRepository)
      : super(MyAppState(themeMode: ThemeModeType.light));

  void toggleTheme() {
    final newThemeMode = state.themeMode == ThemeModeType.light
        ? ThemeModeType.dark
        : ThemeModeType.light;
    emit(state.copyWith(themeMode: newThemeMode));
  }

  void updateUserModel(UserModel userModel) {
    emit(state.copyWith(userModel: userModel));
  }

  void updateUserName(String name) {
    final updatedUserModel = state.userModel?.copyWith(name: name);
    emit(state.copyWith(userModel: updatedUserModel));
  }

  void updateUserEmail(String email) {
    final updatedUserModel = state.userModel?.copyWith(email: email);
    emit(state.copyWith(userModel: updatedUserModel));
  }

  void updateUserPhotoUrl(String photoUrl) {
    final updatedUserModel = state.userModel?.copyWith(photoUrl: photoUrl);
    emit(state.copyWith(userModel: updatedUserModel));
  }

  void clearUser() {
    emit(state.copyWith(userModel: null));
  }

  Future<void> addAppError(AppError error) async {
    emit(state.copyWith(error: error));
    await _errorReportingRepository.reportError(error, error.stackTrace);
    // await _errorReportingRepository.setCustomData('error_type', error.runtimeType.toString());
    // await _errorReportingRepository.logMessage('App error occurred: ${error.message}');
  }
}
