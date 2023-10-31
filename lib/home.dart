import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/registered_habits.dart';
import 'package:provider/provider.dart';
import 'header.dart';
import 'sidebar.dart';
import 'habit_tracker_table.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showHabitForm = false;

  @override
  Widget build(BuildContext context) {
    showHabitFormCb() {
      setState(() {
        showHabitForm = true;
      });
    }

    return ChangeNotifierProvider(
        create: (context) => RegisteredHabits(),
        child: Scaffold(
          backgroundColor: Colors.black87,
          body: Padding(
            padding: const EdgeInsets.all(100),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(callBack: showHabitFormCb),
                        const SizedBox(height: 30),
                        const HabitTrackerTable()
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SideBar(
                    showForm: showHabitForm,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
