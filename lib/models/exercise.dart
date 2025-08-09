enum ExerciseDifficulty { debutant, intermediaire, avance }

class Exercise {
  final String id;
  final String name;
  final String description;
  final String targetArea; // e.g., "Hanche gauche", "Chaîne postérieure"
  final ExerciseDifficulty difficulty;
  final String? videoOrImageUrl; // Optional visual guide

  const Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.targetArea,
    required this.difficulty,
    this.videoOrImageUrl,
  });
}
