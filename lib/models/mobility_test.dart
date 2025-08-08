import 'package:mobility_check_progress/models/test_criterion.dart';

class MobilityTest {
  final String id;
  final String name;
  final String category; // e.g., "Hanches", "Chevilles", "Dos"
  final String instructions; // Brief instructions on how to perform the test
  final List<TestCriterion> criteria; // The detailed evaluation questions

  const MobilityTest({
    required this.id,
    required this.name,
    required this.category,
    required this.instructions,
    required this.criteria,
  });
}
