// ignore_for_file: unnecessary_this, annotate_overrides

import 'dart:collection';

import 'package:todoey/models/tasks.dart';
import 'package:todoey/services/task_service/a_task_service.dart';

class TaskService extends ATaskService {
  final List<Task> _data = [
    Task(text: 'Task 1'),
    Task(text: 'Task 2'),
    Task(text: 'Task 3'),
    Task(text: 'Task 4'),
    Task(text: 'Task 5'),
    Task(text: 'Task 6'),
    Task(text: 'Task 7'),
    Task(text: 'Task 8'),
    Task(text: 'Super long text on multiple lines\n\rline 1\n\rline 2\n\rline 3'),
  ];

  int get taskCount => _data.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_data);

  /// Add a new task
  void add(Task task) {
    this._data.add(task);
    notifyListeners();
  }

  /// Fetch all tasks
  List<Task> fetchAll() {
    return this._data;
  }

  /// Complete a task
  void complete(Task task) {
    this._data.firstWhere((t) => t == task).completed = true;
    notifyListeners();
  }

  void delete(Task task) {
    this._data.remove(task);
    notifyListeners();
  }
}
