import 'package:flutter/material.dart';
import 'package:mobility_check_progress/models/exercise.dart';
import 'package:mobility_check_progress/models/mobility_test.dart';
import 'package:mobility_check_progress/providers/test_provider.dart';
import 'package:provider/provider.dart';

class DiagnosisScreen extends StatelessWidget {
  const DiagnosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Diagnostic'),
        backgroundColor: Colors.teal,
      ),
      body: Consumer<TestProvider>(
        builder: (context, testProvider, child) {
          final weaknesses = testProvider.weaknesses;
          final exercises = testProvider.recommendedExercises;

          if (weaknesses.isEmpty) {
            return _buildNoWeaknessesFound();
          }

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildSectionTitle(context, 'Mes points à améliorer'),
              ...weaknesses.map((test) => _buildWeaknessTile(test)),
              const SizedBox(height: 24),
              _buildSectionTitle(context, 'Exercices recommandés'),
              ...exercises.map((exercise) => _buildExerciseTile(exercise)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNoWeaknessesFound() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.check_circle_outline, color: Colors.green, size: 80),
            SizedBox(height: 16),
            Text(
              'Excellent travail !',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Aucun point faible majeur détecté d\'après vos derniers tests. Continuez comme ça !',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildWeaknessTile(MobilityTest test) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.warning_amber_rounded, color: Colors.orange),
        title: Text(test.name),
        subtitle: Text(test.category),
      ),
    );
  }

  Widget _buildExerciseTile(Exercise exercise) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const Icon(Icons.fitness_center, color: Colors.teal),
        title: Text(exercise.name),
        subtitle: Text(exercise.targetArea),
      ),
    );
  }
}
