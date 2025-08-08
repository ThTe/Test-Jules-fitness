import 'package:mobility_check_progress/models/exercise.dart';
import 'package:mobility_check_progress/models/mobility_test.dart';
import 'package:mobility_check_progress/models/test_criterion.dart';

final List<MobilityTest> mockTests = [
  const MobilityTest(
    id: 't1',
    name: 'Deep Squat Assessment',
    category: 'Chaîne inférieure',
    instructions: 'Effectuez un squat complet, aussi bas que possible, en gardant les bras tendus devant vous.',
    criteria: [
      TestCriterion(id: 't1c1', question: 'Vos talons restent-ils au sol pendant toute la descente ?'),
      TestCriterion(id: 't1c2', question: 'Vos genoux partent-ils vers l\'intérieur (valgus) ?'),
      TestCriterion(id: 't1c3', question: 'Votre torse penche-t-il excessivement vers l\'avant ?'),
      TestCriterion(id: 't1c4', question: 'Le bas de votre dos s\'arrondit-il de manière significative (butt wink) ?'),
    ],
  ),
  const MobilityTest(
    id: 't2',
    name: '90/90 Hip Switch',
    category: 'Hanches',
    instructions: 'Assis au sol, genoux pliés à 90°, basculez vos genoux d\'un côté à l\'autre sans utiliser vos mains.',
    criteria: [
      TestCriterion(id: 't2c1', question: 'Réussissez-vous le mouvement sans utiliser vos mains comme support ?'),
      TestCriterion(id: 't2c2', question: 'Votre fesse opposée reste-t-elle au sol (ou très proche) ?'),
      TestCriterion(id: 't2c3', question: 'Ressentez-vous un pincement ou une douleur dans le dos ou les hanches ?'),
    ],
  ),
  const MobilityTest(
    id: 't3',
    name: 'Test de fente dynamique',
    category: 'Chaîne inférieure',
    instructions: 'Faites un grand pas en avant et descendez en fente, puis revenez à la position de départ.',
    criteria: [], // To be detailed later
  ),
  const MobilityTest(
    id: 't4',
    name: 'Flexion dorsale cheville (Knee-to-Wall)',
    category: 'Chevilles',
    instructions: 'Face à un mur, avancez votre pied jusqu\'à ce que votre genou puisse toucher le mur sans que le talon ne se décolle.',
    criteria: [], // To be detailed later
  ),
];

final List<Exercise> mockExercises = [
  const Exercise(
    id: 'e1',
    name: '90/90 Hip Rotation',
    description: 'Améliore la rotation interne et externe de la hanche.',
    targetArea: 'Hanches',
    difficulty: ExerciseDifficulty.intermediaire,
  ),
  const Exercise(
    id: 'e2',
    name: 'Kneeling Psoas Stretch',
    description: 'Étire le psoas et les fléchisseurs de la hanche.',
    targetArea: 'Hanches',
    difficulty: ExerciseDifficulty.debutant,
  ),
  const Exercise(
    id: 'e3',
    name: 'Ankle Dorsiflexion Against Wall',
    description: 'Mobilise l\'articulation de la cheville en flexion dorsale.',
    targetArea: 'Chevilles',
    difficulty: ExerciseDifficulty.debutant,
  ),
  const Exercise(
    id: 'e4',
    name: 'Cat-Cow Stretch',
    description: 'Améliore la flexion et l\'extension de la colonne vertébrale.',
    targetArea: 'Dos',
    difficulty: ExerciseDifficulty.debutant,
  ),
  const Exercise(
    id: 'e5',
    name: 'Assisted Deep Squat Hold',
    description: 'Aide à développer le confort et la profondeur dans la position de squat.',
    targetArea: 'Chaîne inférieure',
    difficulty: ExerciseDifficulty.intermediaire,
  ),
];
