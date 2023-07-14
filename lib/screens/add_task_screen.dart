// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks.dart';
import 'package:todoey/services/task_service/task_service.dart';
import 'package:todoey/utilities/constants.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

  Task newTask = Task(text: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: Constants.kAddTaskContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Add task label
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: Constants.kAddTaskButtonStyle,
              ),

              // Task text field
              TextField(
                autofocus: true,
                onChanged: (value) {
                  newTask.text = value;
                },
              ),
              SizedBox(
                height: 10,
              ),

              // Add task button
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.lightBlueAccent),
                ),
                onPressed: () {
                  context.read<TaskService>().add(newTask);
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
