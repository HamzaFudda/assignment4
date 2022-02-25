import 'package:assignment4/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class todoList extends ChangeNotifier {
  //this list will contain all the todo tasks
  List<todoTask> tasks = [];

  addTasks(
      {required String title_f,
      required String description_f,
      required DateTime dateTime_f,
      required bool done_f}) {
    todoTask temp = todoTask(
        title: title_f,
        description: description_f,
        dateTime: dateTime_f,
        done: done_f);
    tasks.add(temp);
    notifyListeners();
  }

  void printList() {
    for (int i = 0; i < tasks.length; i++) {
      todoTask temp = tasks[i];
      print(temp.title + " " + temp.description);
    }
  }
}
