import 'package:assignment4/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class newtask extends StatefulWidget {
  const newtask({Key? key}) : super(key: key);

  @override
  _newtaskState createState() => _newtaskState();
}

class _newtaskState extends State<newtask> {
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 30),
              child: TextField(
                controller: _title,
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 10, 24, 30),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _description,
                style: TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 70),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: "Description",
                    disabledBorder: InputBorder.none,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            datePicker(selectedDate: _selectedDate,onPressedUpdate: (recieved_date){
              _selectedDate=recieved_date;
              setState(() {
              });
            },
            ),
            Text("$_selectedDate"),
            SizedBox(height: 20,),


          ],
        ),
      ),
    );
  }

}


class datePicker extends StatefulWidget {
  final Function(DateTime) onPressedUpdate;
  DateTime selectedDate;
  datePicker({Key? key,required this.selectedDate,required this.onPressedUpdate}) : super(key: key);

  @override
  _datePickerState createState() => _datePickerState();
}

class _datePickerState extends State<datePicker> {


  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
        onPressed: () {
          _selectDate(context);
        },
        child: Text("Choose Date"),
      );
  }
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != widget.selectedDate) {
      setState(() {
        widget.selectedDate = selected;
      }
      );
      widget.onPressedUpdate(widget.selectedDate);
  }
  }
}

