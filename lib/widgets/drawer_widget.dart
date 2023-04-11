import 'package:blockdeepdive/views/recycle_bin_screen.dart';
import 'package:blockdeepdive/views/task_screen.dart';
import 'package:flutter/material.dart';

import 'package:blockdeepdive/bloc/task/task_state.dart';

class DrawerWidget extends StatelessWidget {
  final TaskState state;
  final String currentRoute;

  const DrawerWidget({super.key, required this.state, required this.currentRoute});

  void navigateToRoute(BuildContext context, String routeName) {

  if (currentRoute != routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  } else {
    Navigator.pop(context);
  }
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('All Tasks'),
            onTap: () {
            
              navigateToRoute(context, TaskScreen.screen_name);
            },
            trailing: Text(state.tasks.length.toString()),
          ),
          ListTile(
            title: const Text('Recycle Bin'),
            trailing: Text(state.removedtask.length.toString()),
            onTap: () {

               navigateToRoute(context, RecycleBinScreen.screen_name);
             
            },
          ),
        ],
      ),
    );
  }
}
