import 'package:blockdeepdive/bloc/task/task_block.dart';
import 'package:blockdeepdive/bloc/task/task_event.dart';
import 'package:blockdeepdive/bloc/task/task_state.dart';
import 'package:blockdeepdive/modals/modals.dart';
import 'package:blockdeepdive/models/task.dart';
import 'package:blockdeepdive/widgets/drawer_widget.dart';
import 'package:blockdeepdive/widgets/h_space.dart';
import 'package:blockdeepdive/widgets/recycle_bin_list_widget.dart';
import 'package:blockdeepdive/widgets/task_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecycleBinScreen extends StatefulWidget {
  RecycleBinScreen({Key? key}) : super(key: key);
  static const String screen_name = '/recycle_bin';

  @override
  State<RecycleBinScreen> createState() => _RecycleBinScreenState();
}

class _RecycleBinScreenState extends State<RecycleBinScreen> {
  final TextEditingController _taskNameController = TextEditingController();

  @override
  void dispose() {
    _taskNameController.dispose();
    super.dispose();
  }

  void _addTask(BuildContext context, String value) {
    if (value.isNotEmpty) {
      context.read<TaskBloc>().add(AddTask(task: Task(name: value)));
      Navigator.pop(context);
      _taskNameController.clear();
    } else {
      Modals.showToast(message: 'Please enter task name');
    }
  }

  void _showBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      autofocus: true,
                      onSubmitted: (value) {
                        _addTask(context, value);
                      },
                      controller: _taskNameController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Task Name'),
                    ),
                    ElevatedButton(
                        onPressed: () =>
                            _addTask(context, _taskNameController.text),
                        child: const Text('Add Task'))
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) => Scaffold(
        drawer: DrawerWidget(state: state, currentRoute: currentRoute!),
        appBar: AppBar(
          title: const Text('Recycle Bin'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => _showBottomSheet(context),
                icon: const Icon(Icons.add)),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const HSpace(10),
            Expanded(
              child: RecycleBinListWidget(
                tasks: state.removedtask,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => _showBottomSheet(context),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
