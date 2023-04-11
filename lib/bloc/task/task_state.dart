


import 'package:blockdeepdive/models/task.dart';
import 'package:equatable/equatable.dart';

class TaskState extends Equatable {
  final List<Task> tasks;
  final List<Task> removedtask;
  const TaskState({this.tasks = const <Task>[], this.removedtask = const <Task>[]});
  
  @override
  List<Object?> get props => [tasks,removedtask];
}