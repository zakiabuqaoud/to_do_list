
//import from flutter
import 'package:flutter/material.dart';

//import my files
import '../model/task.dart';

class TaskProvider with ChangeNotifier{

  final List<Task> listOfTask = [
    const Task(title: "Drink Tee", isDone: true),
    const Task(title: "Eat Breakfast", isDone: true),
    const Task(title: "Drink Kaffee", isDone: false),
    const Task(title: "sleep afternoon", isDone: false),
    const Task(title: "buy egg", isDone: true),
  ];

  //Add Task Method
  void addTask(Task task){
    listOfTask.add(Task(title: task.title, isDone: task.isDone),);
    notifyListeners();
  }

  //Edit Task Method
  void editCheckButton(index, bool isDone){
    listOfTask[index] = Task(
      title: listOfTask[index].title,
      isDone: isDone,
    );
    notifyListeners();

  }

  //Delete Task Method
  void deleteTask(int index){
    listOfTask.removeAt(index);
    notifyListeners();
  }

}