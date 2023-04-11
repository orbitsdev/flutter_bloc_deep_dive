import 'package:blockdeepdive/widgets/recycle_bin_lisstyle.dart';
import 'package:flutter/material.dart';
import 'package:blockdeepdive/models/task.dart';

class RecycleBinListWidget extends StatelessWidget {
  final List<Task> tasks;
  const RecycleBinListWidget({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var task = tasks[index];
        return RecycleBinLisstyle(task: task);
      },
      itemCount: tasks.length,
    );
  }
}
