// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks.dart';
import 'package:todoey/services/task_service/task_service.dart';

class TaskWidget extends StatefulWidget {
  Task task;
  Function completeCallback;

  TaskWidget({
    super.key,
    required this.task,
    required this.completeCallback,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 30),
      child: GestureDetector(
        onLongPress: () => context.read<TaskService>().delete(widget.task),
        child: CheckboxListTile(
          title: Text(
            widget.task.text,
            style: TextStyle(
              decoration: widget.task.completed //
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          activeColor: Colors.lightBlueAccent,
          onChanged: (value) {
            setState(() {
              widget.task.completed = value as bool;
            });
            if (widget.task.completed) {
              widget.completeCallback.call();
            }
          },
          value: widget.task.completed,
        ),
      ),
    );
  }
}
