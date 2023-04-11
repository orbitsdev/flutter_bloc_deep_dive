


import 'package:blockdeepdive/models/task.dart';
import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();


  @override
  List<Object> get props => [];
}

class AddTask extends TaskEvent {
  final Task task;
  const AddTask({required this.task});

  
  @override
  List<Object> get props => [];
}

class UpdateTask extends TaskEvent {
  final Task task;
  const UpdateTask({required this.task});

  
  @override
  List<Object> get props => [];
}

class DeleteTask extends TaskEvent {
  final Task task;
  const DeleteTask({required this.task});

  
  @override
  List<Object> get props => [];
}
class RestoreTask extends TaskEvent {
  final Task task;
  const RestoreTask({required this.task});

  
  @override
  List<Object> get props => [];
}
class DeleteRecycleBinTask extends TaskEvent {
  final Task task;
  const DeleteRecycleBinTask({required this.task});

  
  @override
  List<Object> get props => [];
}

