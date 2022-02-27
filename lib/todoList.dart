import 'package:assignment4/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

//this class would implement change notifier and will help us in managing our list with the help of state management
class todoList extends ChangeNotifier {
  //this list will contain all the todo tasks
  List<todoTask> tasks = [];

  //this method will add tasks to our list
  addTasks(
      {required String title_f,
      required String description_f,
      required DateTime dateTime_f,
      required bool done_f}) {
    //dueDatePassed stores the flag value returned by checkDueDate
    bool dueDatePassed = checkDueDate(dateTime_f);
    todoTask temp = todoTask(
        title: title_f,
        description: description_f,
        dateTime: dateTime_f,
        done: done_f,
        dueDatePass: dueDatePassed);
    tasks.add(temp);
    dueDateCheckList();
    sortingList();
    notifyListeners();
  }

  //this method marks as done a task and then notify all listeners about the changes
  void markAsDone({required todoTask task}) {
    task.done = true;
    task.completion_dateTime = DateTime.now();
    sortingList();
    notifyListeners();
  }

  //this method checks whether due date has been passed or not
  bool checkDueDate(DateTime dt) {
    if (DateTime.now().isAfter(dt)) {
      return true;
    }
    return false;
  }

  //this method was created for debugging purposes
  void printList() {
    for (int i = 0; i < tasks.length; i++) {
      todoTask temp = tasks[i];
      print(temp.title + " " + temp.description);
    }
  }

  //this method sorts the list first by date then by is it done or not
  void sortingList() {
    tasks.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? -1 : 1);
    tasks.sort((a, b) => !a.done ? -1 : 1);
  }

  void dueDateCheckList() {
    for (int i = 0; i < tasks.length; i++) {
      tasks[i].dueDatePass = checkDueDate(tasks[i].dateTime);
    }
    notifyListeners();
  }
  void removeFromList(todoTask task){
    tasks.remove(task);
    dueDateCheckList();
    sortingList();
    notifyListeners();
  }
}
