import 'package:http/http.dart' as http;
import 'dart:convert';

class HabitModel {
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  bool? completed;

  HabitModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HabitModel.fromJson(Map<String, dynamic> json) {
    return HabitModel(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class CompletedHabitModel {
  String id;
  String habitId;
  DateTime completedDate;

  CompletedHabitModel({
    required this.id,
    required this.habitId,
    required this.completedDate,
  });

  factory CompletedHabitModel.fromJson(Map<String, dynamic> json) {
    return CompletedHabitModel(
      id: json['id'],
      habitId: json['habitId'],
      completedDate: DateTime.parse(json['completedDate']),
    );
  }
}

class ApiService {
  Future<List<HabitModel>> getAllHabits() async {
    final Uri url = Uri.parse('http://localhost:8000/habits');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<HabitModel> habits =
          data.map((json) => HabitModel.fromJson(json)).toList();
      return habits;
    } else {
      print('Erro na requisição: ${response.statusCode}');
      throw Exception('Erro na requisição: ${response.statusCode}');
    }
  }

  Future<List<CompletedHabitModel>> getCompletedHabits() async {
    final Uri url = Uri.parse('http://localhost:8000/habitsCompDate');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<CompletedHabitModel> completedHabits =
          data.map((json) => CompletedHabitModel.fromJson(json)).toList();
      return completedHabits;
    } else {
      print('Erro na requisição: ${response.statusCode}');
      throw Exception('Erro na requisição: ${response.statusCode}');
    }
  }
}
