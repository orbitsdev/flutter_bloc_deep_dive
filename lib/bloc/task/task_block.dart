import 'package:blockdeepdive/bloc/task/task_event.dart';
import 'package:blockdeepdive/bloc/task/task_state.dart';
import 'package:blockdeepdive/models/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RestoreTask>(_onRestoreTask);
    on<DeleteRecycleBinTask>(_onDeleteRecycleBinTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(removedtask: state.removedtask, tasks: [...state.tasks, event.task]));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    // final int index = state.tasks.indexWhere((element) => element == task);
    final int index = state.tasks.indexOf(task);

    List<Task> tasks = [
      ...state.tasks.where((element) => element != task),
    ];

    task.isDone == false
        ? tasks.insert(index, task.copyWith(isDone: true))
        : tasks.insert(index, task.copyWith(isDone: false));
    emit(TaskState(removedtask: state.removedtask, tasks: tasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {

    final task = event.task;

    List<Task> tasks = [
      ...state.tasks.where((element) => element != task),
    ];

    List<Task> removedtask = [
      ...state.removedtask, event.task
    ];


    emit(TaskState(
      tasks: tasks, 
      removedtask: removedtask)
    );
  }

  void _onRestoreTask(RestoreTask event, Emitter<TaskState> emit) {

    final task = event.task;

  //get the task from remove
    Task restored_task = state.removedtask.firstWhere((element) => element == task);


  //add task to tasks
    List<Task> tasks = [
      ...state.tasks,restored_task
    ];
  // remove the task from removed task
    List<Task> removedtask = [
      ...state.removedtask.where((element) => element != restored_task),
    ];
  
  // update both task

    emit(TaskState(
      tasks: tasks, 
      removedtask: removedtask)
    );
  }

  void _onDeleteRecycleBinTask(DeleteRecycleBinTask event, Emitter<TaskState> emit){

    final task = event.task;

    // remove the task from removed task
    List<Task> removedtask = [
      ...state.removedtask.where((element) => element != task),
    ];


  // update remove task
    emit(TaskState(
      tasks: [...state.tasks],  
      removedtask: removedtask)
    );

  }
}
