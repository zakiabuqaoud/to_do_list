import 'package:flutter/material.dart';
import 'package:todo_zaki/widgets/add_task_modal.dart';

import '../model/task.dart';

class ToDoHomeScreen extends StatelessWidget {
  ToDoHomeScreen({Key? key}) : super(key: key);

  final List<Task> listOfTask = [
    const Task(title: "Drink Tee", isDone: true),
    const Task(title: "Eat Breakfast", isDone: true),
    const Task(title: "Drink Kaffee", isDone: true),
    const Task(title: "sleep afternoon", isDone: true),
    const Task(title: "buy egg", isDone: false),
  ];

  goToModal(context){
    showModalBottomSheet(context: context, builder: (_) => AddTaskModal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 40,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Todo",
                    style: TextStyle(
                        fontSize: 54,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "12 Tasks",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ListView.builder(
                    itemCount: listOfTask.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                        ),
                        child: ListTile(
                          title: Text(
                            listOfTask[index].title,
                          ),
                          trailing: Checkbox(
                            value: listOfTask[index].isDone,
                            onChanged: (value) {},
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          goToModal(context);
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
