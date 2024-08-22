import '../../domain/models/user/user_model.dart';
enum ThemeModeType { light, dark }

class MyAppState {
  final ThemeModeType themeMode;
  final UserModel? userModel;

  MyAppState({required this.themeMode, this.userModel});

  MyAppState copyWith({ThemeModeType? themeMode, UserModel? userModel}) {
    return MyAppState(
      themeMode: themeMode ?? this.themeMode,
      userModel: userModel ?? this.userModel,
    );
  }
}
