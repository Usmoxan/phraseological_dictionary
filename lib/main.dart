import 'package:flutter/material.dart';
import 'package:phraseological_dictionary/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Inglizchа – O‘zbekchа – Ruschа frаzeologizmlаrning qisqаchа lug‘аti',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3988FF)),
          useMaterial3: false,
        ),
        home: const SplashPage());
  }
}
