import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobility_check_progress/models/exercise.dart';
import 'package:mobility_check_progress/widgets/common/section_title.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercise exercise;

  const ExerciseScreen({super.key, required this.exercise});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  static const int _defaultDuration = 30; // 30 seconds
  int _remainingSeconds = _defaultDuration;
  Timer? _timer;
  bool _isRunning = false;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _toggleTimer() {
    if (_isRunning) {
      _timer?.cancel();
    } else {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingSeconds > 0) {
          setState(() {
            _remainingSeconds--;
          });
        } else {
          timer.cancel();
          setState(() {
            _isRunning = false;
          });
        }
      });
    }
    setState(() {
      _isRunning = !_isRunning;
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _remainingSeconds = _defaultDuration;
      _isRunning = false;
    });
  }

  String get _timerText {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
              child: const Center(child: Icon(Icons.play_circle_outline, size: 80, color: Colors.grey)),
            ),
            const SizedBox(height: 24),
            const SectionTitle(title: 'Description'),
            Text(widget.exercise.description, style: Theme.of(context).textTheme.bodyLarge),
            const Spacer(),
            Text(_timerText, style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay),
                  onPressed: _resetTimer,
                  iconSize: 40,
                ),
                const SizedBox(width: 32),
                IconButton(
                  icon: Icon(_isRunning ? Icons.pause_circle_filled : Icons.play_circle_filled),
                  onPressed: _toggleTimer,
                  iconSize: 80,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 32),
                SizedBox(width: 40), // Placeholder for symmetry
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
