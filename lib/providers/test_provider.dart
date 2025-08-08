import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:mobility_check_progress/data/mock_data.dart';
import 'package:mobility_check_progress/models/mobility_test.dart';
import 'package:mobility_check_progress/models/exercise.dart';
import 'package:mobility_check_progress/models/test_result.dart';

class TestProvider with ChangeNotifier {
  final List<TestResult> _results = [];

  // Expose an unmodifiable view of the results list
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

    final latestResults = _latestResults;

    if (latestResults.isEmpty) return 0;

    // Sum the scores of the latest results.
    final totalAchievedScore =
        latestResults.values.fold<int>(0, (sum, current) => sum + current.score);

    // The maximum possible score is based on ALL available tests.
    final maxPossibleScore =
        mockTests.length * 2; // Max score is 2 for each test.

    if (maxPossibleScore == 0) return 0;

    return ((totalAchievedScore / maxPossibleScore) * 100).round();
  }

  /// Returns a list of tests where the latest score is less than 2.
  List<MobilityTest> get weaknesses {
    final latest = _latestResults;
    final weakTestIds = latest.entries
        .where((entry) => entry.value.score < 2)
        .map((entry) => entry.key)
        .toSet();

    if (weakTestIds.isEmpty) return [];

    return mockTests.where((test) => weakTestIds.contains(test.id)).toList();
  }

  /// Returns a list of exercises recommended based on the weaknesses.
  List<Exercise> get recommendedExercises {
    final weakCategories = weaknesses.map((test) => test.category).toSet();

    if (weakCategories.isEmpty) return [];

    return mockExercises
        .where((exercise) => weakCategories.contains(exercise.targetArea))
        .toList();
  }

  void addResult(MobilityTest test, int score) {
    final newResult = TestResult(
      // Using a timestamp for a unique ID for now
      id: DateTime.now().toIso8601String(),
      testId: test.id,
      score: score,
      date: DateTime.now(),
    );

    _results.add(newResult);

    // Notify all listening widgets that the data has changed.
    notifyListeners();
  }
}
