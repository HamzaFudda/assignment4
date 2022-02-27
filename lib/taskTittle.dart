import 'package:assignment4/main.dart';
import 'package:assignment4/todo.dart';
import 'package:assignment4/todoList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class taskTitle extends StatefulWidget {
  todoTask task;

  taskTitle({Key? key, required this.task}) : super(key: key);

  @override
  _taskTitleState createState() => _taskTitleState();
}

class _taskTitleState extends State<taskTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Tittle"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            SizedBox(height: 200),
            Text(widget.task.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),textAlign: TextAlign.center),
            Text(widget.task.description,
                style: TextStyle(color: Colors.black, fontSize: 20),textAlign: TextAlign.center),
            SizedBox(height: 10),
            Text(
                "Due date: " +
                    DateFormat('dd-MMM-yyyy').format(widget.task.dateTime),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )),
            SizedBox(height: 10),
            if (widget.task.done && widget.task.dueDatePass) ...[
              Text(
                  "You marked this task as done on " +
                      DateFormat('dd-MMM-yyyy')
                          .format(widget.task.completion_dateTime) +
                      " after the due date",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),textAlign: TextAlign.center)
            ] else if (widget.task.done) ...[
              Text(
                  "You marked this task as done on " +
                      DateFormat('dd-MMM-yyyy')
                          .format(widget.task.completion_dateTime),
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),textAlign: TextAlign.center)
            ] else if (widget.task.dueDatePass) ...[
              Text("Due date has been passed",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)
            ],
            SizedBox(
              height: 150,
            ),
            if (!widget.task.done) ...[
              RaisedButton(
                  onPressed: () {
                    context.read<todoList>().markAsDone(task: widget.task);
                    setState(() {});
                  },
                  child:
                      const Text('Mark As Done', style: TextStyle(fontSize: 20)),
                  color: Colors.green,
                  textColor: Colors.white,
                  elevation: 5,
                ),

            ]
          ],
        ),
      ),
    );
  }
}
