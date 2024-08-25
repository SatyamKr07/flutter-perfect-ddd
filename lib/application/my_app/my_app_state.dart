// lib/application/my_app/my_app_state.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/models/user/user_model.dart';
import '../../app_core/errors/app_error.dart';

part 'my_app_state.freezed.dart';

enum ThemeModeType { light, dark }

@freezed
class MyAppState with _$MyAppState {
  const factory MyAppState({
    @Default(ThemeModeType.light) ThemeModeType themeMode,
    UserModel? userModel,
    AppError? error,
  }) = _MyAppState;
}
