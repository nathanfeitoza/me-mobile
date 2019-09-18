import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(title: "Título", home: AlunnoView()),
    );

class AlunnoView extends StatefulWidget {
  @override
  _AlunnoViewState createState() => _AlunnoViewState();
}

class _AlunnoViewState extends State<AlunnoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(height: 50),
      RaisedButton(
          child: Text("Test DatePicker"),
          onPressed: () => _selectDate(context)),
      RaisedButton(
          child: Text("Test TimePicker"), onPressed: () => _selectTime(context))
    ]));
  }

  Future<void> _selectDate(inContext) async {
    DateTime selectedDate = await showDatePicker(
        context: inContext,
        initialDate: DateTime.now(),
        firstDate: DateTime(2017),
        lastDate: DateTime(2021));
    print(selectedDate);
  }

  Future<void> _selectTime(inContext) async {
    TimeOfDay selectedTime = await showTimePicker(
      context: inContext,
      initialTime: TimeOfDay.now(),
    );
    print(selectedTime);
  }
}
