import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Good Morning, Caio',
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
        const Text(
          'Fri, Oct 20 - 09',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 30),
        const LinearProgressIndicator(
          value: 0.74,
          backgroundColor: Colors.blue,
          valueColor: AlwaysStoppedAnimation(Colors.red),
        ),
        Container(
          margin: const EdgeInsetsDirectional.only(top: 10),
          alignment: Alignment.centerRight,
          child: const Text(
            '74% achieved',
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
