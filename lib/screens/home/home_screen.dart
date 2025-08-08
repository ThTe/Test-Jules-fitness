import 'package:flutter/material.dart';
import 'package:mobility_check_progress/screens/test_list/test_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tableau de Bord'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildScoreCard(),
          const SizedBox(height: 24),
          _buildQuickActions(context),
          const SizedBox(height: 24),
          _buildProgressSection(),
        ],
      ),
    );
  }

  Widget _buildScoreCard() {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Score Global de Mobilité',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                '85/100', // Placeholder score
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Basé sur votre dernière évaluation.', // Placeholder text
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
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
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          icon: const Icon(Icons.bar_chart),
          label: const Text('Voir mon diagnostic'),
          onPressed: () { /* TODO: Navigate to diagnosis */ },
          style: OutlinedButton.styleFrom(
             foregroundColor: Colors.teal,
             side: const BorderSide(color: Colors.teal),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Progression',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
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
