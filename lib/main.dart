import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/home.dart';
import 'package:habit_tracker_frontend/registered_habits.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Colors.grey.shade100),
        ),
      ),
      home: ChangeNotifierProvider(
        create: (context) => RegisteredHabits(),
        child: const MaterialApp(
          home: HomePage(),
        ),
      ),
    );
  }
}
