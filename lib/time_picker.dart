import 'package:flutter/material.dart';

class TimePickerReference extends StatefulWidget {
  const TimePickerReference({super.key});

  @override
  State<TimePickerReference> createState() => _TimePickerReferenceState();
}

class _TimePickerReferenceState extends State<TimePickerReference> {
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Picker Reference"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child: Text("Choose Time"),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                // 24 hours format
                //"${selectedTime.hour}:${selectedTime.minute}",
                // 12 hours format
                "${selectedTime.format(context)}",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
