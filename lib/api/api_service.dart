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
  String habitId;
  DateTime completedDate;

  CompletedHabitModel({
    required this.habitId,
    required this.completedDate,
  });

  factory CompletedHabitModel.fromJson(Map<String, dynamic> json) {
    return CompletedHabitModel(
      habitId: json['habitId'],
      completedDate: DateTime.parse(json['completedDate']),
    );
  }
}

class ApiService {
  //String baseUrl = 'http://localhost:8000';
  String baseUrl = 'https://habit-tracker-backend.vercel.app/';
  late Uri _habitsUrl;
  late Uri _completedHabitsUrl;
  ApiService() {
    _habitsUrl = Uri.parse('${baseUrl}habits');
    _completedHabitsUrl = Uri.parse('${baseUrl}habitsCompDate');
  }

  Future<List<HabitModel>> getAllHabits() async {
    final response = await http.get(_habitsUrl);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<HabitModel> habits =
          data.map((json) => HabitModel.fromJson(json)).toList();
      return habits;
    } else {
      throw Exception('Erro na requisição: ${response.body}');
    }
  }

  Future<HabitModel> createHabit(String habitName) async {
    final body = jsonEncode({'name': habitName});
    final response = await http.post(
      _habitsUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return HabitModel.fromJson(json);
    } else {
      throw Exception('Erro na requisição: ${response.body}');
    }
  }

  Future<List<CompletedHabitModel>> getCompletedHabits() async {
    final response = await http.get(_completedHabitsUrl);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<CompletedHabitModel> completedHabits =
          data.map((json) => CompletedHabitModel.fromJson(json)).toList();
      return completedHabits;
    } else {
      throw Exception('Erro na requisição: ${response.body}');
    }
  }

  Future<void> completeUncompletHabit(
      String habitId, DateTime completedDate) async {
    final body = jsonEncode(
        {'habitId': habitId, 'completedDate': completedDate.toIso8601String()});

    final response = await http.post(
      _completedHabitsUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    if (response.statusCode != 200) {
      throw Exception('Erro na requisição: ${response.body}');
    }
  }

  Future<void> deleteHabit(String habitId) async {
    final body = jsonEncode({'id': habitId});
    final response = await http.delete(_habitsUrl,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);
    if (response.statusCode != 200) {
      throw Exception('Erro na requisição: ${response.body}');
    }
  }
}
