import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late final PageController _pageController;
  final Map<String, dynamic> _responses = {};
  int _currentPage = 0;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _buildPages();
  }

  void _buildPages() {
    _pages = [
      _buildInstructionPage(),
      ...widget.test.criteria.map((c) => _buildCriterionPage(c)),
      _buildSummaryPage(),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentPage + 1) / _pages.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.test.name),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white.withOpacity(0.2),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: _pages,
      ),
    );
  }

  Widget _buildInstructionPage() {
    return _buildPageContent(
      title: 'Instructions',
      content: Column(
        children: [
          Text(widget.test.instructions, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 24),
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
            child: const Center(child: Icon(Icons.play_circle_outline, size: 80, color: Colors.grey)),
          ),
        ],
      ),
      onNext: _nextPage,
    );
  }

  Widget _buildCriterionPage(TestCriterion criterion) {
    bool isAnswered = _responses.containsKey(criterion.id);

    return _buildPageContent(
      title: 'Évaluation',
      content: Column(
        children: [
          Text(criterion.question, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
          const SizedBox(height: 32),
          if (criterion.responseType == CriterionResponseType.boolean)
            _buildBooleanResponse(criterion),
          if (criterion.responseType == CriterionResponseType.numeric)
            _buildNumericResponse(criterion),
        ],
      ),
      onNext: isAnswered ? _nextPage : null,
    );
  }

  Widget _buildSummaryPage() {
    return _buildPageContent(
      title: 'Test Terminé !',
      content: const Center(
        child: Text('Vous avez répondu à toutes les questions.', style: TextStyle(fontSize: 18)),
      ),
      isFinalPage: true,
    );
  }

  Widget _buildPageContent({required String title, required Widget content, VoidCallback? onNext, bool isFinalPage = false}) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: Theme.of(context).textTheme.displaySmall, textAlign: TextAlign.center),
          const SizedBox(height: 48),
          Expanded(
            child: content,
          ),
          if (!isFinalPage)
            ElevatedButton(
              onPressed: onNext,
              child: const Text('Suivant'),
            )
          else
            ElevatedButton(
              onPressed: () {
                Provider.of<TestProvider>(context, listen: false)
                    .addResult(widget.test, responses: _responses);
                Navigator.of(context).pop();
              },
              child: const Text('Voir mon diagnostic'),
            ),
        ],
      ),
    );
  }

  Widget _buildBooleanResponse(TestCriterion criterion) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildChoiceChip(label: 'Non', value: false, criterion: criterion),
        const SizedBox(width: 16),
        _buildChoiceChip(label: 'Oui', value: true, criterion: criterion),
      ],
    );
  }

  Widget _buildChoiceChip({required String label, required bool value, required TestCriterion criterion}) {
    return FilterChip(
      label: Text(label, style: const TextStyle(fontSize: 16)),
      selected: _responses[criterion.id] == value,
      onSelected: (isSelected) {
        if (isSelected) {
          setState(() {
            _responses[criterion.id] = value;
          });
        }
      },
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    );
  }

  Widget _buildNumericResponse(TestCriterion criterion) {
    return TextField(
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayMedium,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}'))],
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixText: criterion.unit,
      ),
      onChanged: (value) {
        setState(() {
          _responses[criterion.id] = double.tryParse(value) ?? 0.0;
        });
      },
    );
  }
}
