import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/api/api_service.dart';

class RegisteredHabits extends ChangeNotifier {
  List<String> habitNames = [];

  Future<List<String>> getHabitNames() async {
    var apiService = ApiService();
    try {
      var habits = await apiService.fetchData();
      for (var habit in habits) {
        habitNames.add(habit['name']);
      }
      notifyListeners();
      return habitNames;
    } catch (e) {
      print('Erro ao obter hábitos: $e');
      throw Exception('Erro ao obter hábitos: $e');
    }
  }

  void addHabit(String newHabit) {
    habitNames.add(newHabit);
    notifyListeners();
  }

  void removeHabit(String habitName) {
    habitNames.remove(habitName);
    notifyListeners();
  }
}
