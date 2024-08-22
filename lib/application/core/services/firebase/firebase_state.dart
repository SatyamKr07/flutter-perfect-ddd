// application/firebase/firebase_state.dart
import 'package:flutter_perfect_ddd/domain/models/media/media_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../_core/errors/failures.dart';

part 'firebase_state.freezed.dart';

@freezed
class FirebaseState with _$FirebaseState {
  const factory FirebaseState({
    required bool isLoading,
    required List<MediaModel> uploadedMedia,
    required Option<Either<Failure, List<MediaModel>>> mediaOption,
  }) = _FirebaseState;

  factory FirebaseState.initial() => FirebaseState(
    isLoading: false,
    uploadedMedia: [],
    mediaOption: none(),
  );
}
