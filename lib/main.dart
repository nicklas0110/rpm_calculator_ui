import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpm_calculator_ui/calculatorModel.dart';

import 'package:rpm_calculator_ui/commands.dart';
import 'package:rpm_calculator_ui/display.dart';
import 'package:rpm_calculator_ui/keypad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const title = "RPN calculator";
    return MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.dark,
        home: ChangeNotifierProvider<CalculatorModel>(
            create: (context) => CalculatorModel(),
            child: const MainScreen(
              title: title,
            )));
  }
}

class MainScreen extends StatelessWidget {
  final String title;

  const MainScreen({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 2,
            // Consumes state
            child: Display(),
          ),
          Flexible(
            flex: 3,
            // Changes state
            child: Keypad(),
          ),
        ],
      ),
    );
  }
}
