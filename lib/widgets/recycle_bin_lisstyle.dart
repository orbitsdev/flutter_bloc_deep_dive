import 'package:blockdeepdive/bloc/task/task_block.dart';
import 'package:blockdeepdive/bloc/task/task_event.dart';
import 'package:blockdeepdive/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecycleBinLisstyle extends StatelessWidget {
  final Task task;

  const RecycleBinLisstyle({super.key, required this.task});

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
        trailing: PopupMenuButton(
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 'restore',
                child: Text('Restore'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text('Delete'),
              ),
            ];
          },
          onSelected: (value) {
            if (value == 'restore') {
              context.read<TaskBloc>().add(RestoreTask(task: task));
            } else if (value == 'delete') {
             context.read<TaskBloc>().add(DeleteRecycleBinTask(task: task));
            }
          },
        ));
  }
}
