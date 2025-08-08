enum CriterionResponseType {
  boolean, // e.g., Yes/No
  multipleChoice, // e.g., Pain location
}

class TestCriterion {
  final String id;
  final String question;
  final CriterionResponseType responseType;
  final List<String>? options; // Null if not multiple choice

  const TestCriterion({
    required this.id,
    required this.question,
    this.responseType = CriterionResponseType.boolean,
    this.options,
  });
}
