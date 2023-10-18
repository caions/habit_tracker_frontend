import 'package:flutter/material.dart';

class HabitCard extends StatefulWidget {
  final String title;
  const HabitCard({super.key, required this.title});

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    void toggleCompleted() {
      setState(() {
        isCompleted = !isCompleted;
      });
    }

    return Center(
      child: GestureDetector(
        onTap: toggleCompleted,
        child: Card(
          elevation: 0,
          color: isCompleted ? Colors.purple : Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: SizedBox(
            width: 300,
            height: 70,
            child: Stack(
              children: [
                Center(
                  child: Text(widget.title,
                      style: TextStyle(
                          color: isCompleted ? Colors.white : Colors.black)),
                ),
                Positioned(
                  bottom: 7,
                  right: 20,
                  child: Text(isCompleted ? 'Completed' : '',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 10,
                          color: isCompleted ? Colors.white : Colors.black)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
