
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// this is CS50 2023

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _copyDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'sdu_meal_today',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
        ),
        home: const HomePage());
  }
}

Future<void> _copyDatabase() async {}
