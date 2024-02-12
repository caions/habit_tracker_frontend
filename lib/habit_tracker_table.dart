import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/registered_habits.dart';
import 'package:provider/provider.dart';
import 'components/custom_checkbox.dart';

class HabitTrackerTable extends StatelessWidget {
  const HabitTrackerTable({super.key});

  @override
  Widget build(BuildContext context) {
    var habits = Provider.of<RegisteredHabits>(context);
    final habitCells = [];

    for (final habit in habits.memoryHabits) {
      habitCells.add(DataRow(
        color: const MaterialStatePropertyAll(Colors.white),
        cells: <DataCell>[
          DataCell(Text(habit.name)),
          const DataCell(CustomCheckbox()),
          const DataCell(CustomCheckbox()),
          const DataCell(CustomCheckbox()),
          const DataCell(CustomCheckbox()),
          const DataCell(CustomCheckbox()),
          const DataCell(CustomCheckbox()),
          const DataCell(CustomCheckbox()),
        ],
      ));
    }

    return Container(
      height: 400,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 2.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: ListView(children: [
        DataTable(
          columns: const [
            DataColumn(
              label: Expanded(
                child: Text(
                  'Habit Name',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Sun',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Mon',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Tue',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Wed',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Thu',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Fri',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Sat',
                  style: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
          rows: <DataRow>[...habitCells],
        )
      ]),
    );
  }
}
