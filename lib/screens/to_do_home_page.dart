
//import from flutter
import 'package:flutter/material.dart';

//import from External Libraries
import 'package:provider/provider.dart';

//import my files
import 'package:todo_zaki/my_providers/task_provider.dart';
import 'package:todo_zaki/widgets/add_task_modal.dart';

class ToDoHomeScreen extends StatelessWidget {
  const ToDoHomeScreen({Key? key}) : super(key: key);

  goToModal(context){
    showModalBottomSheet(context: context, builder: (_) => AddTaskModal());
  }

  @override
  Widget build(BuildContext context) {
    var listOfTask = context.watch<TaskProvider>().listOfTask;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Todo",
                    style: TextStyle(
                        fontSize: 54,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "${listOfTask.length} Tasks",
                    style: const TextStyle(
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
                        child: GestureDetector(
                          onLongPress:(){
                            Provider.of<TaskProvider>(context, listen: false).deleteTask(index);
                          },
                          child: ListTile(
                            title: Text(
                              listOfTask[index].title, style: listOfTask[index].isDone ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
                            ),
                            trailing: Checkbox(
                              value: listOfTask[index].isDone,
                              onChanged: (value) {
                                Provider.of<TaskProvider>(context, listen: false).editCheckButton(index, value as bool);
                              },
                            ),
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
