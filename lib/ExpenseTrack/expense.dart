import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class SavingPage extends StatefulWidget {
  const SavingPage({super.key});

  @override
  State<SavingPage> createState() => _SavingPageState();
}

class _SavingPageState extends State<SavingPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final _formkey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();
  final moneyController = TextEditingController();

  int money = 0;
  String name = "";
  String amount = "0";

  List<Map<String, dynamic>> expenseCategories = [
    {"name": "Food", "icon": Icons.fastfood},
    {"name": "Daily", "icon": Icons.local_cafe},
    {"name": "Transport", "icon": Icons.directions_bus},
    {"name": "Social", "icon": Icons.wine_bar},
    {"name": "Housing", "icon": Icons.home},
    {"name": "Gifts", "icon": Icons.card_giftcard},
    {"name": "Clothing", "icon": Icons.shopping_bag},
    {"name": "Entertainment", "icon": Icons.movie},
    {"name": "Beauty", "icon": Icons.brush},
    {"name": "Medical", "icon": Icons.local_hospital},
    {"name": "Tax", "icon": Icons.attach_money},
  ];

  void _onKeyTap(String value) {
    setState(() {
      if (amount == "0") {
        amount = value;
      } else {
        amount += value;
      }
    });
  }

  void _clearAmount() {
    setState(() {
      amount = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF9F0),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarFormat: CalendarFormat.week,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              defaultTextStyle: TextStyle(color: Colors.black),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                _selectedDay == null
                    ? "No habit on this date"
                    : "Selected: ${DateFormat('dd MMM yyyy').format(_selectedDay!)}",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "THB $amount",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: GridView.builder(
                            padding: EdgeInsets.all(5),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              childAspectRatio: 1.2,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                            ),
                            itemCount: expenseCategories.length,
                            itemBuilder: (context, index) {
                              return CategoryItem(expenseCategories[index]);
                            },
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.pink[200],
                        padding: EdgeInsets.all(5),
                        child: GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          childAspectRatio: 1.5,
                          children: [
                            ...List.generate(9, (index) {
                              return NumberButton(
                                number: (index + 1).toString(),
                                onTap: _onKeyTap,
                              );
                            }),
                            NumberButton(number: ".", onTap: _onKeyTap),
                            NumberButton(number: "0", onTap: _onKeyTap),
                            IconButton(
                              icon: Icon(Icons.backspace, color: Colors.white),
                              onPressed: _clearAmount,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        backgroundColor: Colors.green,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Map<String, dynamic> category;
  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(category['icon'], size: 32, color: Colors.purple),
        Text(category['name']),
      ],
    );
  }
}

class NumberButton extends StatelessWidget {
  final String number;
  final Function(String) onTap;

  NumberButton({required this.number, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(number),
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.pink[400],
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          number,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
