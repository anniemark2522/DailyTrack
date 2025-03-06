import 'package:flutter/material.dart';
import 'package:project_anne/MoodTrack/addMood.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF9F0),
      // appBar: AppBar(
      //     backgroundColor: Colors.white,
      //     title: Row(
      //       children: [
      //         CircleAvatar(
      //           backgroundColor: Colors.grey[300],
      //           child: Icon(
      //             Icons.person,
      //             color: Colors.white,
      //           ),
      //         ),
      //         SizedBox(
      //           width: 10,
      //         ),
      //         Text(
      //           "${_focusedDay.month}" "/" "${_focusedDay.year}",
      //           style: TextStyle(color: Colors.black, fontSize: 18),
      //         ),
      //         Icon(Icons.arrow_drop_down, color: Colors.black),
      //       ],
      //     )),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarFormat: CalendarFormat.month,
            focusedDay: _focusedDay,
            // selectedDayPredicate: (day) {
            //   return isSameDay(_selectedDay, day);
            // },
            // onDaySelected: (selectedDay, focusedDay) {
            //   setState(() {
            //     _selectedDay = selectedDay;
            //     _focusedDay = focusedDay;
            //   });
            // },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              // selectedDecoration: BoxDecoration(
              //   color: Colors.red,
              //   shape: BoxShape.circle,
              // ),
              defaultTextStyle: TextStyle(color: Colors.black),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
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
