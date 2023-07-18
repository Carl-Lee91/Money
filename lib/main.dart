import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money/firebase_options.dart';
import 'package:money/screen/start_screen.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: MoneyApp(),
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MoneyApp extends ConsumerStatefulWidget {
  const MoneyApp({super.key});

  @override
  ConsumerState<MoneyApp> createState() => MoneyAppState();
}

class MoneyAppState extends ConsumerState<MoneyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      themeMode: ThemeMode.system,
      home: StartScreen(),
    );
  }
}
