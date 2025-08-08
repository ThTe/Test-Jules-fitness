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
