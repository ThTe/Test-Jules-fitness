class TestResult {
  final String id;
  final String testId; // Links to MobilityTest.id
  final DateTime date;
  // Stores the answers to each criterion for the test.
  // Key: TestCriterion.id, Value: user's response (e.g., bool, String)
  final Map<String, dynamic> responses;
  final int score; // A calculated score based on the responses

  TestResult({
    required this.id,
    required this.testId,
    required this.date,
    required this.responses,
    required this.score,
  });
}
