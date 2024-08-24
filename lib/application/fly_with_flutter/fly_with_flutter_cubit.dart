import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/models/fly_with_flutter/tutorial_step.dart';
import '../../infrastructure/fly_with_flutter/tutorial_repository.dart';

@lazySingleton
class FlyWithFlutterCubit extends Cubit<FlyWithFlutterState> {
  final TutorialRepository _repository;

  FlyWithFlutterCubit(this._repository) : super(FlyWithFlutterState.initial());

  Future<void> loadTutorialData() async {
    emit(state.copyWith(isLoading: true));
    try {
      final data = await _repository.fetchTutorialData();
      emit(state.copyWith(
        isLoading: false,
        tutorialSteps: data,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  void toggleStepCompletion(String stepId, bool isCompleted) {
    final updatedSteps =
        _updateStepCompletion(state.tutorialSteps, stepId, isCompleted);
    emit(state.copyWith(tutorialSteps: updatedSteps));
  }

  List<TutorialStep> _updateStepCompletion(
      List<TutorialStep> steps, String stepId, bool isCompleted) {
    return steps.map((step) {
      if (step.id == stepId) {
        return step.copyWith(isCompleted: isCompleted);
      } else if (step.subSteps.isNotEmpty) {
        final updatedSubSteps =
            _updateStepCompletion(step.subSteps, stepId, isCompleted);
        return step.copyWith(subSteps: updatedSubSteps);
      }
      return step;
    }).toList();
  }

  void incrementLikes(String stepId) {
    final updatedSteps = _updateStepLikes(state.tutorialSteps, stepId);
    emit(state.copyWith(tutorialSteps: updatedSteps));
  }

  List<TutorialStep> _updateStepLikes(List<TutorialStep> steps, String stepId) {
    return steps.map((step) {
      if (step.id == stepId) {
        return step.copyWith(likes: step.likes + 1);
      } else if (step.subSteps.isNotEmpty) {
        final updatedSubSteps = _updateStepLikes(step.subSteps, stepId);
        return step.copyWith(subSteps: updatedSubSteps);
      }
      return step;
    }).toList();
  }

  void addStep(TutorialStep newStep, String? parentId) {
    final updatedSteps = _addStepToList(state.tutorialSteps, newStep, parentId);
    emit(state.copyWith(tutorialSteps: updatedSteps));
  }

  List<TutorialStep> _addStepToList(
      List<TutorialStep> steps, TutorialStep newStep, String? parentId) {
    if (parentId == null) {
      return [...steps, newStep];
    }

    return steps.map((step) {
      if (step.id == parentId) {
        return step.copyWith(subSteps: [...step.subSteps, newStep]);
      } else if (step.subSteps.isNotEmpty) {
        final updatedSubSteps =
            _addStepToList(step.subSteps, newStep, parentId);
        return step.copyWith(subSteps: updatedSubSteps);
      }
      return step;
    }).toList();
  }

  void updateStep(TutorialStep updatedStep) {
    final updatedSteps = _updateStepInList(state.tutorialSteps, updatedStep);
    emit(state.copyWith(tutorialSteps: updatedSteps));
  }

  List<TutorialStep> _updateStepInList(
      List<TutorialStep> steps, TutorialStep updatedStep) {
    return steps.map((step) {
      if (step.id == updatedStep.id) {
        return updatedStep;
      } else if (step.subSteps.isNotEmpty) {
        final updatedSubSteps = _updateStepInList(step.subSteps, updatedStep);
        return step.copyWith(subSteps: updatedSubSteps);
      }
      return step;
    }).toList();
  }
}

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
