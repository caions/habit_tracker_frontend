import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.red,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Good Morning, Caio'),
                Text('Dom, Set 03 - 09'),
                Text('Progress Bar'),
                Text('Table'),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Side Bar'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
