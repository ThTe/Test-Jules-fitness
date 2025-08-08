import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:mobility_check_progress/data/mock_data.dart';
import 'package:mobility_check_progress/models/mobility_test.dart';
import 'package:mobility_check_progress/models/exercise.dart';
import 'package:mobility_check_progress/models/test_result.dart';

class TestProvider with ChangeNotifier {
  final List<TestResult> _results = [];

  UnmodifiableListView<TestResult> get results => UnmodifiableListView(_results);

  Map<String, TestResult> get _latestResults {
    final Map<String, TestResult> latest = {};
    for (var result in _results) {
      if (!latest.containsKey(result.testId) ||
          result.date.isAfter(latest[result.testId]!.date)) {
        latest[result.testId] = result;
      }
    }
    return latest;
  }

  int get globalScore {
    if (mockTests.isEmpty) return 0;
    final latest = _latestResults;
    if (latest.isEmpty) return 0;

    final totalAchievedScore = latest.values.fold<int>(0, (sum, current) => sum + current.score);
    final maxPossibleScore = mockTests.length * 2;

    if (maxPossibleScore == 0) return 0;
    return ((totalAchievedScore / maxPossibleScore) * 100).round();
  }

  List<MobilityTest> get weaknesses {
    final latest = _latestResults;
    final weakTestIds = latest.entries
        .where((entry) => entry.value.score < 2)
        .map((entry) => entry.key)
        .toSet();

    if (weakTestIds.isEmpty) return [];
    return mockTests.where((test) => weakTestIds.contains(test.id)).toList();
  }

  List<Exercise> get recommendedExercises {
    final weakCategories = weaknesses.map((test) => test.category).toSet();
    if (weakCategories.isEmpty) return [];
    return mockExercises.where((exercise) => weakCategories.contains(exercise.targetArea)).toList();
  }

  /// A simple temporary scoring logic.
  /// If any response is 'true' (indicating a fault), score is 1. Otherwise, score is 2.
  int _calculateScoreFromResponses(Map<String, dynamic> responses) {
    // If there are no responses, we can't calculate a score. This shouldn't happen
    // if the UI enables the button correctly, but as a safeguard:
    if (responses.isEmpty) return 1;

    bool anyFault = responses.values.any((response) => response == true);
    return anyFault ? 1 : 2;
  }

  void addResult(MobilityTest test, {Map<String, dynamic>? responses, int? score}) {
    // Ensure that either responses or a score is provided, but not both.
    assert((responses != null && score == null) || (responses == null && score != null));

    final int finalScore = score ?? _calculateScoreFromResponses(responses!);

    final newResult = TestResult(
      id: DateTime.now().toIso8601String(),
      testId: test.id,
      date: DateTime.now(),
      // Use provided responses or an empty map if score was given directly
      responses: responses ?? {},
      score: finalScore,
    );

    _results.add(newResult);
    notifyListeners();
  }
}
