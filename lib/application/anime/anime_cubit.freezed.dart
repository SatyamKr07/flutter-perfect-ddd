// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnimeState {
  int get currentPage => throw _privateConstructorUsedError;
  int get itemsPerPage => throw _privateConstructorUsedError;
  List<AnimeModel> get animeList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasNextPage => throw _privateConstructorUsedError;
  AppError? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeStateCopyWith<AnimeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeStateCopyWith<$Res> {
  factory $AnimeStateCopyWith(
          AnimeState value, $Res Function(AnimeState) then) =
      _$AnimeStateCopyWithImpl<$Res, AnimeState>;
  @useResult
  $Res call(
      {int currentPage,
      int itemsPerPage,
      List<AnimeModel> animeList,
      bool isLoading,
      bool hasNextPage,
      AppError? error});
}

/// @nodoc
class _$AnimeStateCopyWithImpl<$Res, $Val extends AnimeState>
    implements $AnimeStateCopyWith<$Res> {
  _$AnimeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? itemsPerPage = null,
    Object? animeList = null,
    Object? isLoading = null,
    Object? hasNextPage = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      animeList: null == animeList
          ? _value.animeList
          : animeList // ignore: cast_nullable_to_non_nullable
              as List<AnimeModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnimeStateImplCopyWith<$Res>
    implements $AnimeStateCopyWith<$Res> {
  factory _$$AnimeStateImplCopyWith(
          _$AnimeStateImpl value, $Res Function(_$AnimeStateImpl) then) =
      __$$AnimeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPage,
      int itemsPerPage,
      List<AnimeModel> animeList,
      bool isLoading,
      bool hasNextPage,
      AppError? error});
}

/// @nodoc
class __$$AnimeStateImplCopyWithImpl<$Res>
    extends _$AnimeStateCopyWithImpl<$Res, _$AnimeStateImpl>
    implements _$$AnimeStateImplCopyWith<$Res> {
  __$$AnimeStateImplCopyWithImpl(
      _$AnimeStateImpl _value, $Res Function(_$AnimeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? itemsPerPage = null,
    Object? animeList = null,
    Object? isLoading = null,
    Object? hasNextPage = null,
    Object? error = freezed,
  }) {
    return _then(_$AnimeStateImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
      animeList: null == animeList
          ? _value._animeList
          : animeList // ignore: cast_nullable_to_non_nullable
              as List<AnimeModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasNextPage: null == hasNextPage
          ? _value.hasNextPage
          : hasNextPage // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
    ));
  }
}

/// @nodoc

class _$AnimeStateImpl implements _AnimeState {
  const _$AnimeStateImpl(
      {this.currentPage = 1,
      this.itemsPerPage = 5,
      final List<AnimeModel> animeList = const [],
      this.isLoading = false,
      this.hasNextPage = true,
      this.error})
      : _animeList = animeList;

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final int itemsPerPage;
  final List<AnimeModel> _animeList;
  @override
  @JsonKey()
  List<AnimeModel> get animeList {
    if (_animeList is EqualUnmodifiableListView) return _animeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animeList);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasNextPage;
  @override
  final AppError? error;

  @override
  String toString() {
    return 'AnimeState(currentPage: $currentPage, itemsPerPage: $itemsPerPage, animeList: $animeList, isLoading: $isLoading, hasNextPage: $hasNextPage, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimeStateImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage) &&
            const DeepCollectionEquality()
                .equals(other._animeList, _animeList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasNextPage, hasNextPage) ||
                other.hasNextPage == hasNextPage) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      itemsPerPage,
      const DeepCollectionEquality().hash(_animeList),
      isLoading,
      hasNextPage,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimeStateImplCopyWith<_$AnimeStateImpl> get copyWith =>
      __$$AnimeStateImplCopyWithImpl<_$AnimeStateImpl>(this, _$identity);
}

abstract class _AnimeState implements AnimeState {
  const factory _AnimeState(
      {final int currentPage,
      final int itemsPerPage,
      final List<AnimeModel> animeList,
      final bool isLoading,
      final bool hasNextPage,
      final AppError? error}) = _$AnimeStateImpl;

  @override
  int get currentPage;
  @override
  int get itemsPerPage;
  @override
  List<AnimeModel> get animeList;
  @override
  bool get isLoading;
  @override
  bool get hasNextPage;
  @override
  AppError? get error;
  @override
  @JsonKey(ignore: true)
  _$$AnimeStateImplCopyWith<_$AnimeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
