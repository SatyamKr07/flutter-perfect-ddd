import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class TutorialStep {
  final String id;
  final String title;
  final String description;
  final String? link;
  final List<TutorialStep> subSteps;
  bool isCompleted;
  int likes;
  List<String> comments;

  TutorialStep({
    required this.id,
    required this.title,
    required this.description,
    this.link,
    this.subSteps = const [],
    this.isCompleted = false,
    this.likes = 0,
    this.comments = const [],
  });

  factory TutorialStep.fromJson(Map<String, dynamic> json) {
    return TutorialStep(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      link: json['link'],
      subSteps: (json['subSteps'] as List?)
          ?.map((step) => TutorialStep.fromJson(step))
          .toList() ?? [],
      isCompleted: json['isCompleted'] ?? false,
      likes: json['likes'] ?? 0,
      comments: List<String>.from(json['comments'] ?? []),
    );
  }

  TutorialStep copyWith({
    String? id,
    String? title,
    String? description,
    String? link,
    List<TutorialStep>? subSteps,
    bool? isCompleted,
    int? likes,
    List<String>? comments,
  }) {
    return TutorialStep(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      link: link ?? this.link,
      subSteps: subSteps ?? this.subSteps,
      isCompleted: isCompleted ?? this.isCompleted,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
    );
  }
}

class TutorialData {
  static Future<List<TutorialStep>> fetchTutorialData() async {
    // Simulating API call by reading from a local JSON file
    final String response = await rootBundle.loadString('assets/tutorial_data.json');
    final data = await json.decode(response) as List;
    return data.map((json) => TutorialStep.fromJson(json)).toList();
  }
}