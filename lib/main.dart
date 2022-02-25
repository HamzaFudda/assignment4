import 'package:assignment4/date.dart';
import 'package:assignment4/newTask.dart';
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
      home: const MyHomePage(title: "title"),
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
        body: tasks());
  }
}

class notask extends StatelessWidget {
  const notask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ElevatedButton(onPressed: () {}, child: Text("Add Task")),
        ],
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

          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => newTask()));
              },
              child: Text("Add Task")),
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
      itemCount: context.read<todoList>().tasks.length,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: ListTile(
            //tileColor: Colors.cyan,
            title: Row(children: [
              Text("context.read<todoList>().tasks[index].title"),
            ]),
            // subtitle: Text(DateFormat('dd-MMM-yyyy')
            //     .format(context.watch<todoList>().tasks[index].dateTime)),
             trailing: Row(
              children: [
                IconButton(
                    iconSize: 30,
                    color: Colors.green,
                    icon: Icon(Icons.add_circle_rounded),
                    onPressed: () {
                      setState(() {});
                    }),
              ],
            )
        ),
      ),
    );
  }
}

