import 'package:flutter/material.dart';
import 'package:nalarm/history.dart';
import 'package:nalarm/medic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HistoryScreen());
  }
}
