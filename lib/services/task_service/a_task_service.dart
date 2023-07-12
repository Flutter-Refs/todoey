import 'package:todoey/models/tasks.dart';

abstract class ATaskService {
  List<Task> fetchAll();
  void add(Task task);
  void complete(Task task);
}
