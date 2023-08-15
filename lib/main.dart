
//import from flutter
import 'package:flutter/material.dart';

//import from External Libraries
import 'package:provider/provider.dart';

//import my files
import './my_providers/task_provider.dart';
import 'package:todo_zaki/screens/to_do_home_page.dart';


void main() {
  runApp(ChangeNotifierProvider<TaskProvider>(
    create: (_) => TaskProvider(),
    child: const MyApp(),),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ToDoHomeScreen(),
    );
  }
}


