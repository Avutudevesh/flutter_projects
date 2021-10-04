import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/screens/tasks_screen.dart';

import 'models/task.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => TasksList(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => TasksScreen(),
      },
    );
  }
}

class TasksList with ChangeNotifier {
  List<Task> _tasks = [];

  void addToTaskList(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  List<Task> getTaskList() {
    return _tasks;
  }

  void changeTaskState(Task task, bool value) {
    task.changeTaskState(value);
    notifyListeners();
  }
}
