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
    bool dueDatePassed = checkDueDate(dateTime_f);
    todoTask temp = todoTask(
        title: title_f,
        description: description_f,
        dateTime: dateTime_f,
        done: done_f,
        dueDatePass: dueDatePassed);
    tasks.add(temp);
    sortingList();
    notifyListeners();
  }
  void markAsDone({required todoTask task}){
    task.done=true;
    task.completion_dateTime=DateTime.now();
    sortingList();
    notifyListeners();
  }

  bool checkDueDate(DateTime dt) {
    if (DateTime.now().isAfter(dt)) {
      return true;
    }
    return false;
  }

  void printList() {
    for (int i = 0; i < tasks.length; i++) {
      todoTask temp = tasks[i];
      print(temp.title + " " + temp.description);
    }
  }

  void sortingList() {
    tasks.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? -1 : 1);
    tasks.sort((a, b) => !a.done ? -1 : 1);
  }
}
