import 'package:flutter/material.dart';
import 'screens/CoffeeOnboardingScreen.dart';
import 'screens/CoffeeHomeScreen.dart';
import 'screens/CoffeeDetailsScreen.dart';

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
      theme: ThemeData(

        fontFamily: 'Sora',
        primaryColor: const Color(0xFFC67C4E),
      ),
      home: const CoffeeOnboardingScreen(),
      routes: {
        '/home': (context) => const CoffeeHomeScreen(),
       
      },
    );
  }
}