import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/registered_habits.dart';
import 'package:provider/provider.dart';

class HabitCard extends StatefulWidget {
  final String id;
  final String title;
  final bool? completed;
  const HabitCard({
    super.key,
    required this.id,
    required this.title,
    required this.completed,
  });

  @override
  State<HabitCard> createState() => _HabitCardState();
}

enum SampleItem { itemOne, itemTwo }

class _HabitCardState extends State<HabitCard> {
  SampleItem? selectedMenu;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    isCompleted = widget.completed == null ? false : widget.completed!;
  }

  @override
  Widget build(BuildContext context) {
    var habitNames = Provider.of<RegisteredHabits>(context);

    void toggleCompleted() {
      habitNames.completeHabit(widget.id);
      setState(() {
        isCompleted = !isCompleted;
      });
    }

    return Center(
      child: GestureDetector(
        onDoubleTap: toggleCompleted,
        child: Card(
          elevation: 0,
          color: isCompleted ? Colors.blue : Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 300,
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.title,
                            style: TextStyle(
                                fontSize: 18,
                                color:
                                    isCompleted ? Colors.white : Colors.black)),
                        PopupMenuButton<SampleItem>(
                          initialValue: selectedMenu,
                          // Callback that sets the selected popup menu item.
                          onSelected: (SampleItem item) {
                            setState(() {
                              selectedMenu = item;
                            });
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<SampleItem>>[
                            /*     const PopupMenuItem<SampleItem>(
                              value: SampleItem.itemOne,
                              child: Text('Edit the Habit'),
                            ), */
                            PopupMenuItem<SampleItem>(
                              value: SampleItem.itemTwo,
                              child: const Text('Delete the Habit'),
                              onTap: () {
                                habitNames.removeHabit(widget.id);
                              },
                            ),
                          ],
                        ),
                      ]),
                  Visibility(
                    visible: isCompleted,
                    child: Row(children: [
                      Container(
                        margin: const EdgeInsets.only(right: 2),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                      const Text('Completed',
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
