import 'package:flutter/material.dart';

class HabitForm extends StatefulWidget {
  final Function callBack;
  const HabitForm({super.key, required this.callBack});

  @override
  State<HabitForm> createState() => _HabitFormState();
}

class _HabitFormState extends State<HabitForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showForm = true;

  @override
  Widget build(BuildContext context) {
    hideHabitForm() {
      widget.callBack();
    }

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
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
                    if (_formKey.currentState!.validate())
                      {
                        // Process data.
                      }
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
