import 'package:flutter/material.dart';
import 'package:money/start_screen.dart';

void main() {
  runApp(const MoneyApp());
}

class MoneyApp extends StatelessWidget {
  const MoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartScreen(),
    );
  }
}
