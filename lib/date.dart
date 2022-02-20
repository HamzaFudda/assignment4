import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class dateProvider extends ChangeNotifier{
  DateTime _dateTimeate = DateTime.now();

  void selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: _dateTimeate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != _dateTimeate) {
      _dateTimeate = selected;
    }
    notifyListeners();

  }
}