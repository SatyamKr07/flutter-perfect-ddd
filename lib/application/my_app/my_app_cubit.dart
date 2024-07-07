// my_app_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'my_app_state.dart';

class MyAppCubit extends Cubit<MyAppState> {
  MyAppCubit() : super(MyAppState(themeMode: ThemeModeType.light));

  void toggleTheme() {
    final newTheme = state.themeMode == ThemeModeType.light
        ? ThemeModeType.dark
        : ThemeModeType.light;
    emit(state.copyWith(themeMode: newTheme));
  }
}
