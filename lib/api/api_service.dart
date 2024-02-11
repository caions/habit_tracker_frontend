import 'package:http/http.dart' as http;
import 'dart:convert';

class HabitModel {
  String id;
  String name;
  bool? completed;

  HabitModel({
    required this.id,
    required this.name,
  });

  factory HabitModel.fromJson(Map<String, dynamic> json) {
    return HabitModel(id: json['id'], name: json['name']);
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
  final Uri habitsUrl = Uri.parse('http://localhost:8000/habits');

  Future<List<HabitModel>> getAllHabits() async {
    final response = await http.get(habitsUrl);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<HabitModel> habits =
          data.map((json) => HabitModel.fromJson(json)).toList();
      return habits;
    } else {
      print('Erro na requisição: ${response.body}');
      throw Exception('Erro na requisição: ${response.body}');
    }
  }

  Future<HabitModel> createHabit(String habitName) async {
    final body = jsonEncode({'name': habitName});
    final response = await http.post(
      habitsUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return HabitModel.fromJson(json);
    } else {
      print('Erro na requisição: ${response.body}');
      throw Exception('Erro na requisição: ${response.body}');
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
      print('Erro na requisição: ${response.body}');
      throw Exception('Erro na requisição: ${response.body}');
    }
  }
}
