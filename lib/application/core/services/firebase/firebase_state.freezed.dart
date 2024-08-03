// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FirebaseState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<MediaModel> get uploadedMedia => throw _privateConstructorUsedError;
  Option<Either<Failure, List<MediaModel>>> get mediaOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FirebaseStateCopyWith<FirebaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirebaseStateCopyWith<$Res> {
  factory $FirebaseStateCopyWith(
          FirebaseState value, $Res Function(FirebaseState) then) =
      _$FirebaseStateCopyWithImpl<$Res, FirebaseState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<MediaModel> uploadedMedia,
      Option<Either<Failure, List<MediaModel>>> mediaOption});
}

/// @nodoc
class _$FirebaseStateCopyWithImpl<$Res, $Val extends FirebaseState>
    implements $FirebaseStateCopyWith<$Res> {
  _$FirebaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? uploadedMedia = null,
    Object? mediaOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadedMedia: null == uploadedMedia
          ? _value.uploadedMedia
          : uploadedMedia // ignore: cast_nullable_to_non_nullable
              as List<MediaModel>,
      mediaOption: null == mediaOption
          ? _value.mediaOption
          : mediaOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, List<MediaModel>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirebaseStateImplCopyWith<$Res>
    implements $FirebaseStateCopyWith<$Res> {
  factory _$$FirebaseStateImplCopyWith(
          _$FirebaseStateImpl value, $Res Function(_$FirebaseStateImpl) then) =
      __$$FirebaseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<MediaModel> uploadedMedia,
      Option<Either<Failure, List<MediaModel>>> mediaOption});
}

/// @nodoc
class __$$FirebaseStateImplCopyWithImpl<$Res>
    extends _$FirebaseStateCopyWithImpl<$Res, _$FirebaseStateImpl>
    implements _$$FirebaseStateImplCopyWith<$Res> {
  __$$FirebaseStateImplCopyWithImpl(
      _$FirebaseStateImpl _value, $Res Function(_$FirebaseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? uploadedMedia = null,
    Object? mediaOption = null,
  }) {
    return _then(_$FirebaseStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      uploadedMedia: null == uploadedMedia
          ? _value._uploadedMedia
          : uploadedMedia // ignore: cast_nullable_to_non_nullable
              as List<MediaModel>,
      mediaOption: null == mediaOption
          ? _value.mediaOption
          : mediaOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, List<MediaModel>>>,
    ));
  }
}

/// @nodoc

class _$FirebaseStateImpl implements _FirebaseState {
  const _$FirebaseStateImpl(
      {required this.isLoading,
      required final List<MediaModel> uploadedMedia,
      required this.mediaOption})
      : _uploadedMedia = uploadedMedia;

  @override
  final bool isLoading;
  final List<MediaModel> _uploadedMedia;
  @override
  List<MediaModel> get uploadedMedia {
    if (_uploadedMedia is EqualUnmodifiableListView) return _uploadedMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uploadedMedia);
  }

  @override
  final Option<Either<Failure, List<MediaModel>>> mediaOption;

  @override
  String toString() {
    return 'FirebaseState(isLoading: $isLoading, uploadedMedia: $uploadedMedia, mediaOption: $mediaOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._uploadedMedia, _uploadedMedia) &&
            (identical(other.mediaOption, mediaOption) ||
                other.mediaOption == mediaOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_uploadedMedia), mediaOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseStateImplCopyWith<_$FirebaseStateImpl> get copyWith =>
      __$$FirebaseStateImplCopyWithImpl<_$FirebaseStateImpl>(this, _$identity);
}

abstract class _FirebaseState implements FirebaseState {
  const factory _FirebaseState(
      {required final bool isLoading,
      required final List<MediaModel> uploadedMedia,
      required final Option<Either<Failure, List<MediaModel>>>
          mediaOption}) = _$FirebaseStateImpl;

  @override
  bool get isLoading;
  @override
  List<MediaModel> get uploadedMedia;
  @override
  Option<Either<Failure, List<MediaModel>>> get mediaOption;
  @override
  @JsonKey(ignore: true)
  _$$FirebaseStateImplCopyWith<_$FirebaseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
