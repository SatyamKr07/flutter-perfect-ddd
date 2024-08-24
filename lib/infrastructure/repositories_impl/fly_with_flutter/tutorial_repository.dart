import 'package:injectable/injectable.dart';

import '../../../domain/models/fly_with_flutter/tutorial_step.dart';

@lazySingleton
class TutorialRepository {
  Future<List<TutorialStep>> fetchTutorialData() async {
    // Implement the actual data fetching logic here
    // For now, we'll use the existing TutorialData.fetchTutorialData() method
    return await TutorialData.fetchTutorialData();
  }
}
