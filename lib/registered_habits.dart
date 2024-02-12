import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/api/api_service.dart';

class RegisteredHabits extends ChangeNotifier {
  List<HabitModel> memoryHabits = [];
  List<CompletedHabitModel> memoryCompletedHabits = [];

  var apiService = ApiService();

  Future<List<HabitModel>> getHabitNames() async {
    try {
      memoryHabits = await apiService.getAllHabits();
      memoryCompletedHabits = await apiService.getCompletedHabits();
      for (var habit in memoryHabits) {
        habit.completed = memoryCompletedHabits
            .any((completedHabit) => completedHabit.habitId == habit.id);
      }
      notifyListeners();
      return memoryHabits;
    } catch (e) {
      print('Erro ao obter hábitos: $e');
      throw Exception('Erro ao obter hábitos: $e');
    }
  }

  void addHabit(String newHabit) async {
    try {
      final habit = await apiService.createHabit(newHabit);
      memoryHabits.add(habit);
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
    final completedHabit =
        CompletedHabitModel(habitId: habitId, completedDate: now);
    memoryCompletedHabits.add(completedHabit);
    notifyListeners();
  }

  void removeHabit(String habitName) {
    memoryHabits.remove(habitName);
    notifyListeners();
  }
}
