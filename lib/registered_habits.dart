import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/api/api_service.dart';

class RegisteredHabits extends ChangeNotifier {
  List<HabitModel> memoryHabits = [];
  List<CompletedHabitModel> memoryCompletedHabits = [];

  var apiService = ApiService();

  Future<List<HabitModel>> getHabits() async {
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
      throw Exception('Erro ao obter hábitos: $e');
    }
  }

  void addHabit(String newHabit) async {
    try {
      final habit = await apiService.createHabit(newHabit);
      memoryHabits.add(habit);
      notifyListeners();
    } catch (e) {
      throw Exception('Erro ao criar o hábito: $e');
    }
  }

  void completeHabit(String habitId) async {
    DateTime now = DateTime.now().toLocal();
    now = DateTime(now.year, now.month, now.day).toUtc();
    await apiService.completeUncompletHabit(habitId, now);

    if (memoryCompletedHabits.any((habit) => habit.habitId == habitId)) {
      memoryCompletedHabits.removeWhere((habit) => habit.habitId == habitId);
    } else {
      final completedHabit =
          CompletedHabitModel(habitId: habitId, completedDate: now);
      memoryCompletedHabits.add(completedHabit);
    }

    for (var habit in memoryHabits) {
      habit.completed = memoryCompletedHabits
          .any((completedHabit) => completedHabit.habitId == habit.id);
    }

    notifyListeners();
  }

  void removeHabit(String habitId) async {
    try {
      await apiService.deleteHabit(habitId);
      memoryHabits.removeWhere((habit) => habit.id == habitId);
    } catch (e) {
      throw Exception('Erro ao remover o habito: $e');
    }
    notifyListeners();
  }
}
