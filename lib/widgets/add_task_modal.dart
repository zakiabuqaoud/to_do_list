
//import from flutter
import 'package:flutter/material.dart';
//import External Libraries
import 'package:provider/provider.dart';
//import my files
import 'package:todo_zaki/my_providers/task_provider.dart';
import 'package:todo_zaki/model/task.dart';

class AddTaskModal extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController taskTitleController = TextEditingController();

  AddTaskModal({Key? key}) : super(key: key);

  void addTaskInModel(context, String taskTitle) {
    if (_formKey.currentState!.validate()) {
      print("here");
      Provider.of<TaskProvider>(context,listen: false).addTask(Task(title: taskTitle, isDone: false));
      Navigator.of(context).pop();
    }
  }

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
              controller: taskTitleController,
              decoration: const InputDecoration(
                hintText: "Add Task Title",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                addTaskInModel(context, taskTitleController.text);
              },
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
