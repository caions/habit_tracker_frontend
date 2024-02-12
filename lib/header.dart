import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/registered_habits.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Header extends StatefulWidget {
  final Function callBack;
  const Header({super.key, required this.callBack});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    callBackFn() {
      widget.callBack();
    }

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('E, d MMM y').format(now);
    var userName = "Caio";

    String greetingMessage() {
      if (DateTime.now().hour >= 0 && DateTime.now().hour <= 11) {
        return 'Good Morning $userName';
      } else if (DateTime.now().hour >= 12 && DateTime.now().hour <= 17) {
        return 'Good Affternoon $userName';
      } else {
        return 'Good Eveening $userName';
      }
    }

    var habits = Provider.of<RegisteredHabits>(context);
    double percentualCompleted = 0.0;
    int totalCompleted =
        habits.memoryHabits.where((habit) => habit.completed == true).length;
    var decimalCompleted = 0.0;
    if (habits.memoryHabits.isNotEmpty) {
      decimalCompleted = totalCompleted / habits.memoryHabits.length;
    }
    percentualCompleted = (decimalCompleted * 100).roundToDouble();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          greetingMessage(),
          style: const TextStyle(color: Colors.white, fontSize: 50),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              formattedDate,
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
