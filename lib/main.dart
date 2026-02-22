import 'package:flutter/material.dart';
import 'screens/CoffeeOnboardingScreen.dart';
import 'screens/CoffeeHomeScreen.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee App',
      home: const CoffeeOnboardingScreen(),
      routes: {
        '/home': (context) => const CoffeeHomeScreen(),
      },
    );
  }
}