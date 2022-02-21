import 'package:assignment4/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class newtask extends StatefulWidget {
  const newtask({Key? key}) : super(key: key);

  @override
  _newtaskState createState() => _newtaskState();
}

class _newtaskState extends State<newtask> {
  TextEditingController titleMainController = TextEditingController();
  TextEditingController descriptionMainController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
      ),
      body: Container(
        child: SingleChildScrollView(
        child:Column(
          children: <Widget>[
            SizedBox(height: 50),
            title(titleController: titleMainController),
            description(descriptionController: descriptionMainController),
            datePicker(
                selectedDate: _selectedDate,
                onPressedUpdate: (recieved_date) {
                  _selectedDate = recieved_date;
                }),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Add Task"))
          ],
        ),
        ),
      ),
    );
  }
}

class datePicker extends StatefulWidget {
  final Function(DateTime) onPressedUpdate;
  DateTime selectedDate;

  datePicker(
      {Key? key, required this.selectedDate, required this.onPressedUpdate})
      : super(key: key);

  @override
  _datePickerState createState() => _datePickerState();
}

class _datePickerState extends State<datePicker> {
  TextEditingController _date = TextEditingController();
  DateTime? selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Text(DateFormat('dd-MMM-yyyy').format(widget.selectedDate)),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 30),
          child: TextField(
            controller: _date,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () async {
                    await _selectDate(context);
                    (selected != null)
                        ? _date.text = DateFormat('dd-MMM-yyyy')
                            .format(widget.selectedDate)
                        : _date.clear();
                    setState(() {});
                  },
                ),
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: "Due date",
                disabledBorder: InputBorder.none,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    selected = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != widget.selectedDate) {
      setState(() {
        widget.selectedDate = selected!;
      });
      widget.onPressedUpdate(widget.selectedDate);
    }
    print(selected);
  }
}

class title extends StatelessWidget {
  TextEditingController titleController = TextEditingController();

  title({Key? key, required this.titleController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
      child: TextField(
        controller: titleController,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: "Title",
            disabledBorder: InputBorder.none,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}

class description extends StatelessWidget {
  TextEditingController descriptionController = TextEditingController();

  description({Key? key, required this.descriptionController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        controller: descriptionController,
        style: TextStyle(color: Colors.black, fontSize: 20),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 50, 12, 10),
            fillColor: Colors.grey.shade100,
            filled: true,
            hintText: "Description",
            disabledBorder: InputBorder.none,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}


