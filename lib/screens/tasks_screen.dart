// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_this

import 'package:flutter/material.dart';
import 'package:todoey/components/task_widget.dart';
import 'package:todoey/models/tasks.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/services/task_service/a_task_service.dart';
import 'package:todoey/services/task_service/task_service.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  ATaskService taskService = TaskService();
  late List<TaskWidget> _tasksWidgets;

  @override
  void initState() {
    super.initState();
    _tasksWidgets = getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      // add new task btn
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AddTaskScreen(addTaskCallback: (Task task) {
                setState(() {
                  _tasksWidgets.add(
                    TaskWidget(
                      task: task,
                      completeCallback: (Task task) {
                        taskService.complete(task);
                      },
                    ),
                  );
                });
              }),
            ),
          );
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Menu / Title / Tasks count
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Hamburger menu
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // Title
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  // Tasks count
                  Text(
                    '${taskService.fetchAll().length} Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tasks
          Expanded(
            child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                // List view builder
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var tasks = taskService.fetchAll();
                    return TaskWidget(
                      task: tasks[index],
                      completeCallback: () {
                        taskService.complete(tasks[index]);
                      },
                    );
                  },
                  itemCount: taskService.fetchAll().length,
                )),
          ),
        ],
      ),
    );
  }

  List<TaskWidget> getTasks() {
    var tasks = <TaskWidget>[];
    for (var task in taskService.fetchAll()) {
      tasks.add(
        TaskWidget(
          task: task,
          completeCallback: (Task task) {
            taskService.complete(task);
          },
        ),
      );
    }
    return tasks;
  }
}
