import 'package:assignment4/date.dart';
import 'package:assignment4/newTask.dart';
import 'package:assignment4/todoList.dart';
import 'package:flutter/material.dart';
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
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: listof())
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
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
            style: Theme
                .of(context)
                .textTheme
                .headline6,
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
          // SizedBox(
          //   height: 10,
          // ),

          //ElevatedButton(onPressed: () {}, child: Text("Add Task")),
        ],
      ),
    );
  }
}
class listof extends StatefulWidget {
  const listof({Key? key}) : super(key: key);

  @override
  _listofState createState() => _listofState();
}

class _listofState extends State<listof> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, position) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              position.toString(),
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        );
      },
    );
  }
}



