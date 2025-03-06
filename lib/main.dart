import 'package:flutter/material.dart';
import 'book_page.dart'; // นำเข้าหน้าใหม่ที่สร้างไว้
import 'mood.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int screenIndex = 0;

  final List<String> appBarTitles = [
    'Daily Track',      // index 0 - Home
    'Book Track',    // index 1 - BookPage
    'Money Track',          // index 2 - Savings
    'Mood Track',         // index 3 - Emotions
    'Settings',         // index 4 - Settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF9F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              appBarTitles[screenIndex],   // ใช้ชื่อตาม screenIndex
              style: TextStyle(
                color: Color(0xFF534684),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                print("Avatar tapped");
              },
              child: CircleAvatar(
                backgroundImage: AssetImage(''),
                radius: 20,
              ),
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: screenIndex,
        children: [
          Center(child: Text('Home Screen', style: TextStyle(fontSize: 18))),
          BookPage(),
          Center(child: Text('Savings Screen', style: TextStyle(fontSize: 18))),
          // Center(child: Text('Emotions Screen', style: TextStyle(fontSize: 18))),
          MoodPage(),
          Center(child: Text('Settings Screen', style: TextStyle(fontSize: 18))),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            'Daily Track',
            style: TextStyle(
              color: Color(0xFF534684),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {
              print("Avatar tapped");
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(''),
              radius: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    screenIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.book,
                  color: screenIndex == 1 ? Color(0xFFC5E1A5) : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    screenIndex = 2;
                  });
                },
                icon: Icon(
                  Icons.savings,
                  color: screenIndex == 2 ? Color(0xFFC5E1A5) : Colors.grey,
                ),
              ),
              SizedBox(width: 50),
              IconButton(
                onPressed: () {
                  setState(() {
                    screenIndex = 3;
                  });
                },
                icon: Icon(
                  Icons.emoji_emotions,
                  color: screenIndex == 3 ? Colors.green : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    screenIndex = 4;
                  });
                },
                icon: Icon(
                  Icons.settings,
                  color: screenIndex == 4 ? Colors.green : Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 2 - 35,
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                screenIndex = 0;
              });
            },
            backgroundColor: Color(0xFFC5E1A5),
            shape: CircleBorder(),
            child: Icon(Icons.home, color: Colors.white, size: 30),
          ),
        ),
      ],
    );
  }
}
