import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/registered_habits.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  final Function callBack;
  const Header({super.key, required this.callBack});

  @override
  Widget build(BuildContext context) {
    callBackFn() {
      callBack();
    }

    var habitsList = Provider.of<RegisteredHabits>(context);
    double percentualCompleted = 0.0;
    int totalCompleted = habitsList.memoryHabits
        .where((habit) => habit.completed == true)
        .length;
    var decimalCompleted = 0.0;
    if (habitsList.memoryHabits.isNotEmpty) {
      decimalCompleted = totalCompleted / habitsList.memoryHabits.length;
    }
    percentualCompleted = (decimalCompleted * 100).roundToDouble();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Good Morning, Caio',
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              DateTime.now().toString(),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            OutlinedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  overlayColor: MaterialStateProperty.all(Colors.white12)),
              onPressed: callBackFn,
              child: const Row(
                children: [
                  Icon(Icons.add, color: Colors.white, size: 18),
                  SizedBox(width: 3),
                  Text('Add a Habit'),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
        LinearProgressIndicator(
          value: decimalCompleted,
          backgroundColor: Colors.blue,
          valueColor: const AlwaysStoppedAnimation(Colors.red),
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(top: 10),
          alignment: Alignment.centerRight,
          child: Text(
            '$percentualCompleted% achieved',
            textAlign: TextAlign.right,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
