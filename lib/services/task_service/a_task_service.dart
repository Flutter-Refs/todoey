import 'package:flutter/material.dart';
import 'package:todoey/models/tasks.dart';

abstract class ATaskService extends ChangeNotifier {
  List<Task> fetchAll();
  void add(Task task);
  void complete(Task task);
  void delete(Task task);
}
