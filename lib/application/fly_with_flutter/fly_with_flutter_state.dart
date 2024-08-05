import '../../domain/core/models/fly_with_flutter/tutorial_step.dart';

class FlyWithFlutterState {
  final bool isLoading;
  final List<TutorialStep> tutorialSteps;
  final String? error;

  FlyWithFlutterState({
    required this.isLoading,
    required this.tutorialSteps,
    this.error,
  });

  factory FlyWithFlutterState.initial() => FlyWithFlutterState(
        isLoading: true,
        tutorialSteps: [],
      );

  FlyWithFlutterState copyWith({
    bool? isLoading,
    List<TutorialStep>? tutorialSteps,
    String? error,
  }) {
    return FlyWithFlutterState(
      isLoading: isLoading ?? this.isLoading,
      tutorialSteps: tutorialSteps ?? this.tutorialSteps,
      error: error ?? this.error,
    );
  }
}
