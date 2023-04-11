import 'package:blockdeepdive/widgets/recycle_bin_lisstyle.dart';
import 'package:flutter/material.dart';
import 'package:blockdeepdive/models/task.dart';
import 'task_listtile.dart';

class TaskListWidget extends StatelessWidget {
  final List<Task> tasks;
  const TaskListWidget({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var task = tasks[index];
        return TaskListtile(task: task);
      },
      itemCount: tasks.length,
    );
  }
}
