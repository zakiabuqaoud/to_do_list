import 'package:flutter/material.dart';

class AddTaskModal extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AddTaskModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 36,
        right: 36,
        bottom: 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const Text(
              "Add Task",
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 28,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: "Add Task Title",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "ADD TASK",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            // Add TextFormFields and ElevatedButton here.
          ],
        ),
      ),
    );
  }
}
