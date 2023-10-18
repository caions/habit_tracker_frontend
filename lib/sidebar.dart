import 'package:flutter/material.dart';
import 'components/habit_card.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tue, Oct 17',
          style: TextStyle(color: Colors.white),
        ),
        HabitCard(title: 'Run'),
        HabitCard(title: 'Study'),
        HabitCard(title: 'Work')
      ],
    );
  }
}
