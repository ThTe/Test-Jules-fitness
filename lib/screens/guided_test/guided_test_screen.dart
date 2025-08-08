import 'package:flutter/material.dart';
import 'package:mobility_check_progress/models/mobility_test.dart';
import 'package:mobility_check_progress/providers/test_provider.dart';
import 'package:provider/provider.dart';

class GuidedTestScreen extends StatefulWidget {
  final MobilityTest test;

  const GuidedTestScreen({super.key, required this.test});

  @override
  State<GuidedTestScreen> createState() => _GuidedTestScreenState();
}

class _GuidedTestScreenState extends State<GuidedTestScreen> {
  int? _selectedScore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.test.name),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder for image/animation
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.video_camera_front_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 8),
                  Text('Vidéo ou animation du test', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Test description
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(widget.test.description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 24),

            // Scoring section
            Text(
              'Évaluez votre performance',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildScoreSelector(),
            const SizedBox(height: 32),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedScore == null
                    ? null
                    : () {
                        Provider.of<TestProvider>(context, listen: false)
                            .addResult(widget.test, _selectedScore!);
                        Navigator.of(context).pop(); // Go back to the list
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text('TERMINER LE TEST'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreSelector() {
    // As per spec: 0 = impossible, 1 = partiel, 2 = complet sans douleur
    final scores = {
      0: 'Impossible',
      1: 'Partiel',
      2: 'Complet',
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: scores.entries.map((entry) {
        final score = entry.key;
        final label = entry.value;
        final isSelected = _selectedScore == score;

        return InkWell(
          onTap: () {
            setState(() {
              _selectedScore = score;
            });
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: isSelected ? Colors.teal.withOpacity(0.1) : Colors.grey.shade200,
              border: Border.all(
                color: isSelected ? Colors.teal : Colors.grey.shade300,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.teal : Colors.black87,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
