import 'package:mobility_check_progress/models/exercise.dart';
import 'package:mobility_check_progress/models/mobility_test.dart';

final List<MobilityTest> mockTests = [
  MobilityTest(
    id: 't1',
    name: 'Deep Squat Test',
    description: 'Évalue la mobilité globale des hanches, genoux et chevilles.',
    category: 'Chaîne inférieure',
  ),
  MobilityTest(
    id: 't2',
    name: 'Rotation interne/externe hanche',
    description: 'Mesure l\'amplitude de rotation de l\'articulation de la hanche.',
    category: 'Hanches',
  ),
  MobilityTest(
    id: 't3',
    name: 'Test de fente dynamique',
    description: 'Teste la stabilité et la mobilité en fente.',
    category: 'Chaîne inférieure',
  ),
  MobilityTest(
    id: 't4',
    name: 'Flexion dorsale cheville (Knee-to-Wall)',
    description: 'Évalue la dorsiflexion de la cheville, essentielle pour le squat.',
    category: 'Chevilles',
  ),
  MobilityTest(
    id: 't5',
    name: 'Extension lombaire debout',
    description: 'Vérifie la capacité d\'extension de la colonne lombaire.',
    category: 'Dos',
  ),
];

final List<Exercise> mockExercises = [
  Exercise(
    id: 'e1',
    name: '90/90 Hip Rotation',
    description: 'Améliore la rotation interne et externe de la hanche.',
    targetArea: 'Hanches',
    difficulty: ExerciseDifficulty.intermediaire,
  ),
  Exercise(
    id: 'e2',
    name: 'Kneeling Psoas Stretch',
    description: 'Étire le psoas et les fléchisseurs de la hanche.',
    targetArea: 'Hanches',
    difficulty: ExerciseDifficulty.debutant,
  ),
  Exercise(
    id: 'e3',
    name: 'Ankle Dorsiflexion Against Wall',
    description: 'Mobilise l\'articulation de la cheville en flexion dorsale.',
    targetArea: 'Chevilles',
    difficulty: ExerciseDifficulty.debutant,
  ),
  Exercise(
    id: 'e4',
    name: 'Cat-Cow Stretch',
    description: 'Améliore la flexion et l\'extension de la colonne vertébrale.',
    targetArea: 'Dos',
    difficulty: ExerciseDifficulty.debutant,
  ),
  Exercise(
    id: 'e5',
    name: 'Assisted Deep Squat Hold',
    description: 'Aide à développer le confort et la profondeur dans la position de squat.',
    targetArea: 'Chaîne inférieure',
    difficulty: ExerciseDifficulty.intermediaire,
  ),
];
