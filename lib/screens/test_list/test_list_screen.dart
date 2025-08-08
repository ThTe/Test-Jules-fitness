import 'package:flutter/material.dart';
import 'package:mobility_check_progress/data/mock_data.dart';
import 'package:mobility_check_progress/models/mobility_test.dart';
import 'package:mobility_check_progress/screens/guided_test/guided_test_screen.dart';

class TestListScreen extends StatelessWidget {
  const TestListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tests = mockTests;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisir un test'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: tests.length,
        itemBuilder: (context, index) {
          final test = tests[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              leading: const Icon(Icons.fitness_center, color: Colors.teal),
              title: Text(test.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(test.category),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GuidedTestScreen(test: test),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
