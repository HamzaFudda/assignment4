class todoTask {
  String title;
  String description;
  DateTime dateTime;
  bool done;
  late DateTime completion_dateTime;
  bool dueDatePass;

  todoTask(
      {required this.title,
      required this.description,
      required this.dateTime,
      required this.done,
      required this.dueDatePass});
}
