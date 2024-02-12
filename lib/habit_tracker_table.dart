import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/registered_habits.dart';
import 'package:provider/provider.dart';
import 'components/custom_checkbox.dart';

class HabitTrackerTable extends StatefulWidget {
  const HabitTrackerTable({Key? key}) : super(key: key);

  @override
  State<HabitTrackerTable> createState() => _HabitTrackerTableState();
}

class _HabitTrackerTableState extends State<HabitTrackerTable> {
  @override
  Widget build(BuildContext context) {
    var habits = Provider.of<RegisteredHabits>(context);
    final habitCells = habits.memoryHabits.map((habit) {
      return DataRow(
        color: MaterialStateProperty.all(Colors.white),
        cells: [
          DataCell(Text(habit.name)),
          DataCell(
            // SUN
            CustomCheckbox(
              checked:
                  (habit.completed ?? false) && DateTime.now().weekday == 7,
              onChanged: (value) {
                /* setState(() {
                  habit.completed = value;
                }); */
              },
            ),
          ),
          DataCell(
            // MON
            CustomCheckbox(
              checked:
                  (habit.completed ?? false) && DateTime.now().weekday == 1,
              onChanged: (value) {
                /* setState(() {
                  habit.completed = value;
                }); */
              },
            ),
          ),
          DataCell(
            // TUE
            CustomCheckbox(
              checked:
                  (habit.completed ?? false) && DateTime.now().weekday == 2,
              onChanged: (value) {
                /* setState(() {
                  habit.completed = value;
                }); */
              },
            ),
          ),
          DataCell(
            // WED
            CustomCheckbox(
              checked:
                  (habit.completed ?? false) && DateTime.now().weekday == 3,
              onChanged: (value) {
                /* setState(() {
                  habit.completed = value;
                }); */
              },
            ),
          ),
          DataCell(
            // THU
            CustomCheckbox(
              checked:
                  (habit.completed ?? false) && DateTime.now().weekday == 4,
              onChanged: (value) {
                /* setState(() {
                  habit.completed = value;
                }); */
              },
            ),
          ),
          DataCell(
            // FRI
            CustomCheckbox(
              checked:
                  (habit.completed ?? false) && DateTime.now().weekday == 5,
              onChanged: (value) {
                /* setState(() {
                  habit.completed = value;
                }); */
              },
            ),
          ),
          DataCell(
            // SAT
            CustomCheckbox(
              checked:
                  (habit.completed ?? false) && DateTime.now().weekday == 6,
              onChanged: (value) {
                /* setState(() {
                  habit.completed = value;
                }); */
              },
            ),
          ),
        ],
      );
    }).toList();

    return Container(
      height: 350,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 2.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: ListView(
        children: [
          DataTable(
            columns: const [
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Habit Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Sun',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Mon',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Tue',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Wed',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Thu',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Fri',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'Sat',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
            rows: habitCells,
          ),
        ],
      ),
    );
  }
}
