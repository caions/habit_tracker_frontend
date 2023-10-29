import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/registered_habits.dart';
import 'components/custom_checkbox.dart';

class HabitTrackerTable extends StatelessWidget {
  const HabitTrackerTable({super.key});

  @override
  Widget build(BuildContext context) {
    final habitNames = RegisteredHabits();
    final habitCells = [];

    for (final habitName in habitNames()) {
      habitCells.add(DataRow(
        color: const MaterialStatePropertyAll(Colors.white),
        cells: <DataCell>[
          DataCell(Text(habitName)),
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

    return DataTable(
      columns: const [
        DataColumn(
          label: Expanded(
            child: Text(
              'Habit Name',
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Sun',
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Mon',
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Tue',
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Wed',
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Thu',
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Fri',
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Sat',
              style:
                  TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: <DataRow>[...habitCells],
    );
  }
}
