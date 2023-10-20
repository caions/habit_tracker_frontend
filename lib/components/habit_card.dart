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
        onDoubleTap: toggleCompleted,
        child: Card(
          elevation: 0,
          color: isCompleted ? Colors.purple : Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 300,
              height: 55,
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
                        Icon(
                          Icons.more_vert,
                          color: isCompleted ? Colors.white : Colors.black,
                          size: 24.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        )
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
