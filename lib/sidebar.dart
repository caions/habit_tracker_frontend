import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/api/api_service.dart';
import 'package:habit_tracker_frontend/form_field.dart';
import 'package:habit_tracker_frontend/registered_habits.dart';
import 'package:provider/provider.dart';
import 'components/habit_card.dart';

ScrollController _scrollController = ScrollController();

// ignore: must_be_immutable
class SideBar extends StatefulWidget {
  late bool showForm;
  SideBar({super.key, required this.showForm});

  @override
  // ignore: library_private_types_in_public_api
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<HabitModel> habitsList = [];

  @override
  initState() {
    super.initState();
    _loadHabits();
  }

  _loadHabits() async {
    var registeredHabits =
        Provider.of<RegisteredHabits>(context, listen: false);
    habitsList = await registeredHabits.getHabitNames();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final habitCardList = [];
    for (final habit in habitsList) {
      habitCardList.add(
        HabitCard(title: habit.name, completed: habit.completed),
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
        controller: _scrollController,
        thumbVisibility: true,
        child: ListView(
          controller: _scrollController,
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
            ...habitCardList,
          ],
        ),
      ),
    );
  }
}
