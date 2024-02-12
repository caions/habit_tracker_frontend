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

  void addHabit(String newHabit) async {
    try {
      final habit = await apiService.createHabit(newHabit);
      habitsList.add(habit);
      notifyListeners();
    } catch (e) {
      print('Erro ao criar o hábito: $e');
      throw Exception('Erro ao criar o hábito: $e');
    }
  }

  void completeHabit(String habitId) async {
    DateTime now = DateTime.now().toLocal();
    now = DateTime(now.year, now.month, now.day).toUtc();
    await apiService.completeUncompletHabit(habitId, now);
  }

  void removeHabit(String habitName) {
    habitsList.remove(habitName);
    notifyListeners();
  }
}
