import 'package:flutter/material.dart';
import 'package:mobility_check_progress/models/mobility_test.dart';
import 'package:mobility_check_progress/models/test_criterion.dart';
import 'package:mobility_check_progress/providers/test_provider.dart';
import 'package:provider/provider.dart';

class GuidedTestScreen extends StatefulWidget {
  final MobilityTest test;

  const GuidedTestScreen({super.key, required this.test});

  @override
  State<GuidedTestScreen> createState() => _GuidedTestScreenState();
}

class _GuidedTestScreenState extends State<GuidedTestScreen> {
  // Use a map to store responses, with the criterion ID as the key.
  final Map<String, dynamic> _responses = {};

  @override
  Widget build(BuildContext context) {
    // The button is enabled only if a response has been provided for every criterion.
    final bool allQuestionsAnswered = _responses.length == widget.test.criteria.length;

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
            // Instructions section
            Text(
              'Instructions',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(widget.test.instructions, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 24),

            // Video/Image placeholder
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
              child: const Center(child: Icon(Icons.play_circle_outline, size: 80, color: Colors.grey)),
            ),
            const SizedBox(height: 24),

            // Dynamic questionnaire section
            Text(
              'Évaluation',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ..._buildCriteriaWidgets(),
            const SizedBox(height: 32),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: !allQuestionsAnswered
                    ? null
                    : () {
                        Provider.of<TestProvider>(context, listen: false)
                            .addResult(widget.test, responses: _responses);
                        Navigator.of(context).pop();
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
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Provider.of<TestProvider>(context, listen: false)
                      .addResult(widget.test, score: 0);
                  Navigator.of(context).pop();
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey[700],
                  side: BorderSide(color: Colors.grey[400]!),
                ),
                child: const Text('Impossible de réaliser le test'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCriteriaWidgets() {
    return widget.test.criteria.map((criterion) {
      return Card(
        margin: const EdgeInsets.only(top: 12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(criterion.question, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 12),
              if (criterion.responseType == CriterionResponseType.boolean)
                _buildBooleanResponse(criterion),
              // TODO: Add support for other response types like multipleChoice
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _buildBooleanResponse(TestCriterion criterion) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ChoiceChip(
          label: const Text('Non'),
          selected: _responses[criterion.id] == false,
          onSelected: (isSelected) {
            if (isSelected) {
              setState(() {
                _responses[criterion.id] = false;
              });
            }
          },
        ),
        const SizedBox(width: 16),
        ChoiceChip(
          label: const Text('Oui'),
          selected: _responses[criterion.id] == true,
          onSelected: (isSelected) {
            if (isSelected) {
              setState(() {
                _responses[criterion.id] = true;
              });
            }
          },
        ),
      ],
    );
  }
}
