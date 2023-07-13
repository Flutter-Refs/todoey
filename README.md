# todoey

# Flutter

* CheckboxListTile
```
CheckboxListTile(
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
``` 

* BottomSheet
```
CheckboxListTile(
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
``` 

* SingleChildScrollView

* Callback with parameter and return type
  ```
  List<TaskWidget> getTasks() {
    var tasks = <TaskWidget>[];
    for (var task in taskService.fetchAll()) {
      tasks.add(
        TaskWidget(
          task: task,
          // set the callback
          completeCallback: (Task task) {
            taskService.complete(task);
          },
        ),
      );
    }
    return tasks;
  }

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
              // trigger the callback function
              widget.completeCallback.call(widget.task);
            }
          },
          value: widget.task.completed,
        ),
      );
    }
  }

  ```