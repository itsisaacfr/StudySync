import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPlanner extends StatefulWidget {
  const CalendarPlanner({super.key});

  @override
  _CalendarPlannerState createState() => _CalendarPlannerState();
}

class _CalendarPlannerState extends State<CalendarPlanner> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  final Map<DateTime, List<String>> _events = {};
  
  final TextEditingController _taskController = TextEditingController();

  void _addTask(String task) {
    setState(() {
      if (_events[_selectedDay] == null) {
        _events[_selectedDay] = [];
      }
      _events[_selectedDay]!.add(task);
    });
    _taskController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calendar Planner')),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _selectedDay,
            firstDay: DateTime(2000),
            lastDay: DateTime(2100),
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Enter To-Do or Goal',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _addTask(_taskController.text),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _events[_selectedDay]?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_events[_selectedDay]![index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
