import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/form_field.dart';
import 'package:habit_tracker_frontend/registered_habits.dart';
import 'package:provider/provider.dart';
import 'components/habit_card.dart';

// ignore: must_be_immutable
class SideBar extends StatefulWidget {
  late bool showForm;
  SideBar({super.key, required this.showForm});

  @override
  // ignore: library_private_types_in_public_api
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var habits = Provider.of<RegisteredHabits>(context);
    final habitCardList = [];
    for (final habit in habits.memoryHabits) {
      habitCardList.add(
        HabitCard(id: habit.id, title: habit.name, completed: habit.completed),
      );
    }

    callBackFn() {
      setState(() {
        widget.showForm = false;
      });
    }

    return Container(
      width: 500,
      height: 449,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 2.0,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      padding: const EdgeInsets.all(10),
      child: ListView(
        padding: const EdgeInsets.only(right: 15),
        children: [
          const SizedBox(
            height: 5,
          ),
          Visibility(
            visible: widget.showForm,
            child: HabitForm(callBack: callBackFn),
          ),
          ...habitCardList,
        ],
      ),
    );
  }
}
