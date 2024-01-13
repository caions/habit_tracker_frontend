import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/api/api_service.dart';

class RegisteredHabits extends ChangeNotifier {
  List<HabitModel> habitsList = [];
  List<String> completedHabitsId = [];

  var apiService = ApiService();

  Future<List<HabitModel>> getHabitNames() async {
    try {
      var habits = await apiService.getAllHabits();
      var completedHabits = await apiService.getCompletedHabits();

      for (var completedHabit in completedHabits) {
        completedHabitsId.add(completedHabit.habitId);
      }

      for (var habit in habits) {
        habit.completed = completedHabitsId.contains(habit.id);
        habitsList.add(habit);
      }

      notifyListeners();
      return habitsList;
    } catch (e) {
      print('Erro ao obter hábitos: $e');
      throw Exception('Erro ao obter hábitos: $e');
    }
  }

  void addHabit(String newHabit) {
    //habitsList.add(newHabit);
    notifyListeners();
  }

  void removeHabit(String habitName) {
    habitsList.remove(habitName);
    notifyListeners();
  }
}
