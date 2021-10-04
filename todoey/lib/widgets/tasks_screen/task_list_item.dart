import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/main.dart';
import 'package:todoey/models/task.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({@required this.todo}) : super();

  final Task todo;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: todo.isDone,
      onChanged: (value) => Provider.of<TasksList>(context, listen: false)
          .changeTaskState(todo, value),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration:
              todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}
