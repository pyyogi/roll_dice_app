import 'package:flutter/material.dart';
import 'package:lesson_20/example.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ExampleWidget(),
    );
  }
}
