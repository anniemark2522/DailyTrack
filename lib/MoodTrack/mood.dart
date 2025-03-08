import 'package:flutter/material.dart';
import 'package:project_anne/MoodTrack/addMood.dart';
import 'package:table_calendar/table_calendar.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  DateTime _focusedDay = DateTime.now();
  // ตัวแปรที่เก็บค่าการเลือก mood
  List<int?> selectedMoods = [null, null, null];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF9F0),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarFormat: CalendarFormat.month,
            focusedDay: _focusedDay,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Color(0XFFB3E680),
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(
                color: Colors.green,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              selectedDecoration: BoxDecoration(
                color: Color(0XFFFEB0B9),
                shape: BoxShape.circle,
              ),
              defaultTextStyle: TextStyle(
                color: Color(0xFF534684),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              weekendTextStyle: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              selectedTextStyle: TextStyle(
                color: Color(0xFF534684),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                color: Colors.green,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              weekendStyle: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFEB0B9),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Addmood(),
              ));
        },
      ),
    );
  }
}
