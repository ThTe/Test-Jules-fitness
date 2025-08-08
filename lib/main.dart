import 'package:flutter/material.dart';
import 'package:mobility_check_progress/screens/home/home_screen.dart';

void main() {
  runApp(const MobilityApp());
}

class MobilityApp extends StatelessWidget {
  const MobilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobility Check & Progress',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: const HomeScreen(),
    );
  }
}
