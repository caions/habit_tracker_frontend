import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        padding: const EdgeInsets.all(100),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Good Morning, Caio',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  const Text(
                    'Dom, Set 03 - 09',
                    style: TextStyle(color: Colors.white, fontSize: 50),
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
                      '74% achivied',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Table',
                    //https://api.flutter.dev/flutter/material/DataTable-class.html
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text(
                    'Side Bar',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
