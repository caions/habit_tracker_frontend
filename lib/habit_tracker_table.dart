import 'package:flutter/material.dart';
import 'components/custom_checkbox.dart';

class HabitTrackerTable extends StatelessWidget {
  const HabitTrackerTable({super.key});

  @override
  Widget build(BuildContext context) {
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
      rows: const <DataRow>[
        DataRow(
          color: MaterialStatePropertyAll(Colors.white),
          cells: <DataCell>[
            DataCell(Text('Run')),
            DataCell(CustomCheckbox()),
            DataCell(CustomCheckbox()),
            DataCell(CustomCheckbox()),
            DataCell(CustomCheckbox()),
            DataCell(CustomCheckbox()),
            DataCell(CustomCheckbox()),
            DataCell(CustomCheckbox()),
          ],
        ),
        DataRow(
          color: MaterialStatePropertyAll(Colors.white),
          cells: <DataCell>[
            DataCell(Text('Study')),
            DataCell(CustomCheckbox()),
            DataCell(CustomCheckbox()),
            DataCell(CustomCheckbox()),
            DataCell(CustomCheckbox()),
            DataCell(CustomCheckbox()),
            DataCell(CustomCheckbox()),
            DataCell(CustomCheckbox()),
          ],
        ),
      ],
    );
  }
}
