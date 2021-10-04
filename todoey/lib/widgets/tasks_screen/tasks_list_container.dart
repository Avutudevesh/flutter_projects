import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/main.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/widgets/tasks_screen/task_list_item.dart';

class TasksListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Task> tasksList = Provider.of<TasksList>(context).getTaskList();

    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return TaskListItem(todo: tasksList[index]);
          },
          itemCount: tasksList.length,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
