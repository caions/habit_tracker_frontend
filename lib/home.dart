import 'package:flutter/material.dart';
import 'header.dart';
import 'sidebar.dart';
import 'habit_tracker_table.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        padding: const EdgeInsets.all(100),
        child: const Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Header(), SizedBox(height: 30), HabitTrackerTable()],
              ),
            ),
            Expanded(
              flex: 1,
              child: SideBar(),
            ),
          ],
        ),
      ),
    );
  }
}
