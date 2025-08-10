import 'package:mobility_check_progress/models/exercise.dart';
import 'package:mobility_check_progress/models/mobility_test.dart';
import 'package:mobility_check_progress/models/test_criterion.dart';

final List<MobilityTest> mockTests = [
  const MobilityTest(
    id: 't1',
    name: 'Deep Squat Assessment',
    category: 'Chaîne inférieure',
    instructions: 'Debout, pieds écartés à la largeur des épaules, orteils légèrement vers l\'extérieur. Descendez en squat aussi bas que possible en gardant le dos droit et les talons au sol. Tendez les bras devant vous pour l\'équilibre.',
    criteria: [
      TestCriterion(id: 't1c1', question: 'Vos talons se décollent-ils du sol ?'),
      TestCriterion(id: 't1c2', question: 'Vos genoux rentrent-ils vers l\'intérieur ?'),
      TestCriterion(id: 't1c3', question: 'Votre torse penche-t-il excessivement vers l\'avant ?'),
      TestCriterion(id: 't1c4', question: 'Le bas de votre dos s\'arrondit-il de manière marquée (butt wink) ?'),
    ],
  ),
  const MobilityTest(
    id: 't2',
    name: '90/90 Hip Switch',
    category: 'Hanches',
    instructions: 'Asseyez-vous au sol, les deux genoux pliés à 90 degrés, une jambe devant vous et l\'autre sur le côté. Gardez le torse droit et tentez de basculer vos genoux de l\'autre côté sans utiliser vos mains.',
    criteria: [
      TestCriterion(id: 't2c1', question: 'Devez-vous utiliser vos mains pour vous aider ou vous stabiliser ?'),
      TestCriterion(id: 't2c2', question: 'La fesse du côté où les genoux se déplacent se soulève-t-elle beaucoup ?'),
      TestCriterion(id: 't2c3', question: 'Ressentez-vous une douleur ou un pincement (plutôt qu\'un simple étirement) ?'),
    ],
  ),
  const MobilityTest(
    id: 't3',
    name: 'Test de fente dynamique',
    category: 'Chaîne inférieure',
    instructions: 'Debout, faites un grand pas en avant. Descendez jusqu\'à ce que votre cuisse avant soit parallèle au sol, genou au-dessus de la cheville. Le genou arrière doit frôler le sol. Remontez en poussant sur le pied avant. Faites le test pour chaque jambe.',
    criteria: [
      TestCriterion(id: 't3c1', question: 'Perdez-vous l\'équilibre pendant le mouvement ?'),
      TestCriterion(id: 't3c2', question: 'Votre genou avant dépasse-t-il vos orteils ou rentre-t-il vers l\'intérieur ?'),
      TestCriterion(id: 't3c3', question: 'Votre torse penche-t-il de manière significative vers l\'avant ou sur le côté ?'),
    ],
  ),
  const MobilityTest(
    id: 't4',
    name: 'Flexion dorsale cheville (Knee-to-Wall)',
    category: 'Chevilles',
    instructions: 'Face à un mur, en position de fente, le gros orteil du pied avant pointant vers le mur. Avancez ou reculez votre pied pour trouver la distance maximale à laquelle vous pouvez toucher le mur avec votre genou, SANS que votre talon ne se décolle du sol. Mesurez cette distance.',
    criteria: [
      TestCriterion(
        id: 't4c1',
        question: 'Quelle est la distance maximale (en cm) entre votre gros orteil et le mur ?',
        responseType: CriterionResponseType.numeric,
        unit: 'cm',
      ),
      TestCriterion(id: 't4c2', question: 'Ressentez-vous une douleur (pincement à l\'avant, forte tension) ?'),
    ],
  ),
  const MobilityTest(
    id: 't5',
    name: 'Test de mobilité d\'épaule (Apley\'s)',
    category: 'Épaules',
    instructions: 'Debout ou assis. Passez une main par-dessus l\'épaule pour toucher le haut du dos. Passez l\'autre main par le bas pour toucher le bas du dos. Rapprochez vos doigts le plus possible. Mesurez la distance (positive si les doigts ne se touchent pas, négative s\'ils se chevauchent).',
    criteria: [
      TestCriterion(
        id: 't5c1',
        question: 'Quelle est la distance entre vos doigts (en cm) ?',
        responseType: CriterionResponseType.numeric,
        unit: 'cm',
      ),
      TestCriterion(id: 't5c2', question: 'La différence entre le côté gauche et le côté droit est-elle importante ?'),
      TestCriterion(id: 't5c3', question: 'Ressentez-vous une douleur vive dans l\'une des deux épaules ?'),
    ],
  ),
  const MobilityTest(
    id: 't6',
    name: 'Test de Rotation Thoracique (Assis)',
    category: 'Dos',
    instructions: 'Asseyez-vous au bord d\'une chaise, pieds au sol. Placez un bâton sur vos épaules. En gardant le bassin fixe, tournez le haut de votre corps vers la droite, puis vers la gauche, le plus loin possible sans douleur.',
    criteria: [
      TestCriterion(id: 't6c1', question: 'Y a-t-il une différence de rotation visible entre la gauche et la droite ?'),
      TestCriterion(id: 't6c2', question: 'Le bâton s\'incline-t-il (signe que vous vous penchez sur le côté) ?'),
      TestCriterion(id: 't6c3', question: 'Ressentez-vous une douleur ou un blocage dans le milieu du dos ?'),
    ],
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
  const Exercise(
    id: 'e6',
    name: 'Shoulder Pass-Through',
    description: 'Avec un bâton ou un élastique, faites passer vos bras tendus de l\'avant vers l\'arrière de votre corps.',
    targetArea: 'Épaules',
    difficulty: ExerciseDifficulty.debutant,
  ),
  const Exercise(
    id: 'e7',
    name: 'Quadruped Thoracic Rotations',
    description: 'À quatre pattes, placez une main derrière la tête et ouvrez le coude vers le ciel pour mobiliser le haut du dos.',
    targetArea: 'Dos',
    difficulty: ExerciseDifficulty.debutant,
  ),
];
