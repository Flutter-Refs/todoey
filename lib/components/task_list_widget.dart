// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_widget.dart';
import 'package:todoey/services/task_service/task_service.dart';
import 'package:todoey/utilities/constants.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return // Tasks
        Expanded(
      child: Container(
        height: 300,
        decoration: Constants.kTaskListContainerDecoration,
        // List view builder
        child: Consumer<TaskService>(builder: (context, taskService, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              var tasks = taskService.tasks;
              return TaskWidget(
                task: tasks[index],
                completeCallback: () => taskService.complete(tasks[index]),
              );
            },
            itemCount: taskService.taskCount,
          );
        }),
      ),
    );
  }
}
