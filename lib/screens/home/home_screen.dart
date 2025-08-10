import 'package:flutter/material.dart';
import 'package:mobility_check_progress/providers/test_provider.dart';
import 'package:mobility_check_progress/screens/diagnosis/diagnosis_screen.dart';
import 'package:mobility_check_progress/screens/test_list/test_list_screen.dart';
import 'package:mobility_check_progress/widgets/common/section_title.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de Bord'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildScoreCard(context),
          const SizedBox(height: 24),
          _buildQuickActions(context),
          const SizedBox(height: 24),
          _buildProgressSection(),
        ],
      ),
    );
  }

  Widget _buildScoreCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<TestProvider>(
          builder: (context, testProvider, child) {
            final score = testProvider.globalScore;
            final resultsCount = testProvider.results.length;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Score Global de Mobilité',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: Text(
                      '$score/100',
                      // The key is crucial for AnimatedSwitcher to know the widget has changed.
                      key: ValueKey<int>(score),
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  resultsCount == 0
                      ? 'Complétez un test pour voir votre score.'
                      : 'Basé sur vos $resultsCount derniers résultats.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.play_circle_outline),
          label: const Text('LANCER UN NOUVEAU TEST'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TestListScreen()),
            );
          },
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          icon: const Icon(Icons.bar_chart),
          label: const Text('Voir mon diagnostic'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DiagnosisScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Progression'),
        const SizedBox(height: 10),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Graphique de progression (placeholder)',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ),
      ],
    );
  }
}
