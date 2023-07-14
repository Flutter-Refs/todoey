import 'package:flutter/material.dart';

class Constants {
  static const kTaskListContainerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );

  static const kAddTaskContainerDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );

  static const kAddTaskButtonStyle = TextStyle(
    color: Colors.lightBlueAccent,
    fontSize: 25,
    fontWeight: FontWeight.w500,
  );
}
