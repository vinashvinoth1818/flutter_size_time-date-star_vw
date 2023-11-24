import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




class DatePickerRef extends StatefulWidget {
  const DatePickerRef({super.key});

  @override
  State<DatePickerRef> createState() => _DatePickerRefState();
}

class _DatePickerRefState extends State<DatePickerRef> {
  var _dateController = TextEditingController();

  DateTime _dateTime = DateTime.now();

  _selectTodoDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _dateController.text = DateFormat("dd-MM-yyyy").format(_dateTime);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Reference'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: 'Select Date',
                prefixIcon: InkWell(
                  onTap: () {
                    _selectTodoDate(context);
                  },
                  child: Icon(Icons.calendar_today),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
