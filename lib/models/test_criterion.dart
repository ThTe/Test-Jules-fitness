enum CriterionResponseType {
  boolean, // e.g., Yes/No
  multipleChoice, // e.g., Pain location
  numeric, // e.g., distance in cm
}

class TestCriterion {
  final String id;
  final String question;
  final CriterionResponseType responseType;
  final List<String>? options; // For multipleChoice
  final String? unit; // For numeric, e.g., "cm" or "in"

  const TestCriterion({
    required this.id,
    required this.question,
    this.responseType = CriterionResponseType.boolean,
    this.options,
    this.unit,
  });
}
