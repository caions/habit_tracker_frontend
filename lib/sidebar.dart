import 'package:flutter/material.dart';
import 'components/habit_card.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 468,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue, // Cor da borda
            width: 2.0, // Largura da borda
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      padding: const EdgeInsets.all(10),
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView(
          padding: const EdgeInsets.only(right: 15),
          children: const [
            Text(
              'Fri, Oct 20',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            HabitCard(title: 'Run'),
            HabitCard(title: 'Study'),
            HabitCard(title: 'Work'),
            HabitCard(title: 'Run'),
            HabitCard(title: 'Study')
          ],
        ),
      ),
    );
  }
}
