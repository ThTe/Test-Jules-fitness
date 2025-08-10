import 'package:flutter/material.dart';
import 'package:mobility_check_progress/providers/test_provider.dart';
import 'package:mobility_check_progress/screens/home/home_screen.dart';
import 'package:mobility_check_progress/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TestProvider()),
      ],
      child: const MobilityApp(),
    ),
  );
}

class MobilityApp extends StatelessWidget {
  const MobilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobility Check & Progress',
      theme: AppTheme.themeData,
      home: const HomeScreen(),
    );
  }
}
