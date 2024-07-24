import 'package:flutter/material.dart';
import 'package:hive_app/features/todo/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // TODO: 2 Initialize Hive
  await Hive.initFlutter();

  // TODO: 3 Open a Box
  await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber), 
        useMaterial3: true,
      ),
      home: const Todo(),
    );
  }
}
