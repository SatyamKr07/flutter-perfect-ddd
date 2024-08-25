// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyAppState {
  ThemeModeType get themeMode => throw _privateConstructorUsedError;
  UserModel? get userModel => throw _privateConstructorUsedError;
  AppError? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyAppStateCopyWith<MyAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAppStateCopyWith<$Res> {
  factory $MyAppStateCopyWith(
          MyAppState value, $Res Function(MyAppState) then) =
      _$MyAppStateCopyWithImpl<$Res, MyAppState>;
  @useResult
  $Res call({ThemeModeType themeMode, UserModel? userModel, AppError? error});

  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class _$MyAppStateCopyWithImpl<$Res, $Val extends MyAppState>
    implements $MyAppStateCopyWith<$Res> {
  _$MyAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? userModel = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeModeType,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get userModel {
    if (_value.userModel == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userModel!, (value) {
      return _then(_value.copyWith(userModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyAppStateImplCopyWith<$Res>
    implements $MyAppStateCopyWith<$Res> {
  factory _$$MyAppStateImplCopyWith(
          _$MyAppStateImpl value, $Res Function(_$MyAppStateImpl) then) =
      __$$MyAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeModeType themeMode, UserModel? userModel, AppError? error});

  @override
  $UserModelCopyWith<$Res>? get userModel;
}

/// @nodoc
class __$$MyAppStateImplCopyWithImpl<$Res>
    extends _$MyAppStateCopyWithImpl<$Res, _$MyAppStateImpl>
    implements _$$MyAppStateImplCopyWith<$Res> {
  __$$MyAppStateImplCopyWithImpl(
      _$MyAppStateImpl _value, $Res Function(_$MyAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeMode = null,
    Object? userModel = freezed,
    Object? error = freezed,
  }) {
    return _then(_$MyAppStateImpl(
      themeMode: null == themeMode
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeModeType,
      userModel: freezed == userModel
          ? _value.userModel
          : userModel // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
    ));
  }
}

/// @nodoc

class _$MyAppStateImpl implements _MyAppState {
  const _$MyAppStateImpl(
      {this.themeMode = ThemeModeType.light, this.userModel, this.error});

  @override
  @JsonKey()
  final ThemeModeType themeMode;
  @override
  final UserModel? userModel;
  @override
  final AppError? error;

  @override
  String toString() {
    return 'MyAppState(themeMode: $themeMode, userModel: $userModel, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyAppStateImpl &&
            (identical(other.themeMode, themeMode) ||
                other.themeMode == themeMode) &&
            (identical(other.userModel, userModel) ||
                other.userModel == userModel) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeMode, userModel, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyAppStateImplCopyWith<_$MyAppStateImpl> get copyWith =>
      __$$MyAppStateImplCopyWithImpl<_$MyAppStateImpl>(this, _$identity);
}

abstract class _MyAppState implements MyAppState {
  const factory _MyAppState(
      {final ThemeModeType themeMode,
      final UserModel? userModel,
      final AppError? error}) = _$MyAppStateImpl;

  @override
  ThemeModeType get themeMode;
  @override
  UserModel? get userModel;
  @override
  AppError? get error;
  @override
  @JsonKey(ignore: true)
  _$$MyAppStateImplCopyWith<_$MyAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
