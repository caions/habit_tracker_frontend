import 'package:flutter/material.dart';
import 'package:habit_tracker_frontend/registered_habits.dart';
import 'package:provider/provider.dart';

class HabitForm extends StatefulWidget {
  final Function callBack;
  const HabitForm({super.key, required this.callBack});

  @override
  State<HabitForm> createState() => _HabitFormState();
}

class _HabitFormState extends State<HabitForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showForm = true;
  final TextEditingController _habitController = TextEditingController();

  @override
  void dispose() {
    _habitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var habitNames = Provider.of<RegisteredHabits>(context);
    hideHabitForm() {
      widget.callBack();
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _habitController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              hintText: 'Type the habit name',
              contentPadding: EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 10), // Altura menor
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please, insert the habit name';
              }
              return null;
            },
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      overlayColor: MaterialStateProperty.all(Colors.white12)),
                  onPressed: () => {
                    habitNames.addHabit(_habitController.text),
                    _habitController.clear(),
                    hideHabitForm(),
                  },
                  child: const Row(
                    children: [
                      Text('Add'),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.yellowAccent),
                      overlayColor: MaterialStateProperty.all(Colors.white12)),
                  onPressed: hideHabitForm,
                  child: const Text('Cancel'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
