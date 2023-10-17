import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Side',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
