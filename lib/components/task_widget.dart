// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todoey/models/tasks.dart';

class TaskWidget extends StatefulWidget {
  Task task;

  TaskWidget({
    super.key,
    required this.task,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 30),
      child: CheckboxListTile(
        title: Text(
          widget.task.text,
          style: TextStyle(
            decoration: widget.task.completed //
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        onChanged: (value) {
          setState(() {
            widget.task.completed = value as bool;
          });
        },
        value: widget.task.completed,
      ),
    );
  }
}
