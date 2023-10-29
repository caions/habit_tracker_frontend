import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/form_field.dart';
import 'package:habit_tracker_frontend/registered_habits.dart';
import 'components/habit_card.dart';

class SideBar extends StatefulWidget {
  late bool showForm;
  SideBar({super.key, required this.showForm});

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final habitList = [];
  final habitNames = RegisteredHabits();

  @override
  Widget build(BuildContext context) {
    for (final habitName in habitNames()) {
      habitList.add(
        HabitCard(title: habitName),
      );
    }

    callBackFn() {
      setState(() {
        widget.showForm = false;
      });
    }

    return Container(
      height: 468,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 2.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.all(10),
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView(
          padding: const EdgeInsets.only(right: 15),
          children: [
            const Text(
              'Fri, Oct 20',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Visibility(
              visible: widget.showForm,
              child: HabitForm(callBack: callBackFn),
            ),
            ...habitList,
          ],
        ),
      ),
    );
  }
}
