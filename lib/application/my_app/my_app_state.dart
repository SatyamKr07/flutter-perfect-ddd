// my_app_state.dart
enum ThemeModeType { light, dark }

class MyAppState {
  final ThemeModeType themeMode;

  MyAppState({required this.themeMode});

  MyAppState copyWith({ThemeModeType? themeMode}) {
    return MyAppState(themeMode: themeMode ?? this.themeMode);
  }
}
