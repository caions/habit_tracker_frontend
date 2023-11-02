import 'package:flutter/material.dart';

class RegisteredHabits extends ChangeNotifier {
  List<String> habitNames = ['run', 'study', 'play'];

  List<String> getHabitNames() {
    return habitNames.toList();
  }

  void addHabit(String newHabit) {
    habitNames.add(newHabit);
    notifyListeners();
  }

  void removeHabit(String position) {
    habitNames.remove(position);
  }
}
