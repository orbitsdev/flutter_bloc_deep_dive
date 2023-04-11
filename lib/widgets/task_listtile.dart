import 'package:blockdeepdive/bloc/task/task_block.dart';
import 'package:blockdeepdive/bloc/task/task_event.dart';
import 'package:blockdeepdive/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListtile extends StatelessWidget {
  final Task task;

  const TaskListtile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          task.name,
          style: TextStyle(
            color: task.isDone == true ? Colors.grey.shade400 : Colors.white,
            decoration: task.isDone == true ? TextDecoration.lineThrough : null,
            decorationColor: task.isDone == true ? Colors.grey.shade400 : null,
            decorationThickness: 2.0,
          ),
        ),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              Checkbox(
                  value: task.isDone,
                  onChanged: (value) {
                    context.read<TaskBloc>().add(UpdateTask(task: task));
                  }),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  context.read<TaskBloc>().add(DeleteTask(task: task));
                },
              )
            ],
          ),
        ));
  }
}
