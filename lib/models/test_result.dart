class TestResult {
  final String id;
  final String testId; // Links to MobilityTest.id
  final int score; // 0 = impossible, 1 = partiel, 2 = complet
  final DateTime date;
  final String? notes; // Optional user notes

  TestResult({
    required this.id,
    required this.testId,
    required this.score,
    required this.date,
    this.notes,
  });
}
