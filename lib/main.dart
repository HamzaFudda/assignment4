import 'package:assignment4/date.dart';
import 'package:assignment4/newTask.dart';
import 'package:assignment4/taskTittle.dart';
import 'package:assignment4/todoList.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => todoList(),
      ),
      // ChangeNotifierProvider(
      //   create: (_) => dateProvider(),
      // ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const newTask(),
      home: const MyHomePage(title: "TODO list"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: (!context.watch<todoList>().tasks.isEmpty) ? tasks() : notask(),
        floatingActionButton: (!context.watch<todoList>().tasks.isEmpty)
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {});
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => newTask()));
                },
                tooltip: 'new task',
                child: const Icon(Icons.add),
              )
            : null);
  }
}

class notask extends StatelessWidget {
  const notask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have no pending tasks',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => newTask()));
                },
                child: Text("Add Task")),
          ],
        ),
      ),
    );
  }
}

class tasks extends StatefulWidget {
  const tasks({Key? key}) : super(key: key);

  @override
  _tasksState createState() => _tasksState();
}

class _tasksState extends State<tasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(child: listOfTask()),
        ],
      ),
    );
  }
}

class listOfTask extends StatefulWidget {
  const listOfTask({Key? key}) : super(key: key);

  @override
  _listOfTaskState createState() => _listOfTaskState();
}

class _listOfTaskState extends State<listOfTask> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.watch<todoList>().tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: ListTile(
            title: Text(
              context.watch<todoList>().tasks[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Due: " +
                DateFormat('dd-MMM-yyyy')
                    .format(context.watch<todoList>().tasks[index].dateTime)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                (context.watch<todoList>().tasks[index].done)
                    ? IconButton(
                        color: Colors.green,
                        icon: Icon(Icons.check_circle_rounded),
                        onPressed: () {
                          context.read<todoList>().tasks[index].done = false;
                          context.read<todoList>().sortingList();
                          setState(() {});
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.circle_outlined),
                        color: Colors.black,
                        onPressed: () {
                          context.read<todoList>().tasks[index].done = true;
                          context
                              .read<todoList>()
                              .tasks[index]
                              .completion_dateTime = DateTime.now();
                          context.read<todoList>().sortingList();
                          setState(() {});
                        },
                      ),
                (context.watch<todoList>().tasks[index].dueDatePass)
                    ? SizedBox(
                        width: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red,
                          ),
                        ))
                    : SizedBox(
                        width: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                          ),
                        )),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      taskTitle(task: context.read<todoList>().tasks[index])));

            },
          ),
        );
      },
    );
  }
}
