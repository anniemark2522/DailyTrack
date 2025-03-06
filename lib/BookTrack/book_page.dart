import 'package:flutter/material.dart';

class BookPage extends StatelessWidget {
  final List<Book> readingBooks = [
    Book(id: '1', title: 'Chicken', progress: 0.7),
    Book(id: '2', title: 'Egg', progress: 0.5),
    Book(id: '3', title: 'Dog', progress: 0.1),
    Book(id: '4', title: 'Cat', progress: 0.98),
    Book(id: '5', title: 'Rabbit', progress: 0.6),
    Book(id: '6', title: 'Elephant', progress: 0.3),
  ];

  final List<String> finishedBooks = [
    'Bear - Feb 10, 2025 - ⭐⭐⭐⭐',
    'Lion - Jan 5, 2025 - ⭐⭐⭐',
    'Giraffe - Dec 25, 2024 - ⭐⭐⭐⭐⭐',
    'Penguin - Nov 30, 2024 - ⭐⭐⭐⭐',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📖 Currently Reading', 
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green[700])),
            SizedBox(height: 8),

            // ปรับให้โชว์แค่ 3 อัน แล้วเลื่อนในแนวตั้ง
            SizedBox(
              height: 500, // กำหนดความสูงรวมของ list
              child: ListView.builder(
                itemCount: readingBooks.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final book = readingBooks[index];
                  return BookCard(
                    book: book,
                    onEdit: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => AddBookScreen(book: book),
                      ));
                    },
                  );
                },
              ),
            ),

            SizedBox(height: 16),

            Text('📚 Finished Reading', 
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[700])),
            SizedBox(height: 8),

            // Finished Reading แบบแสดงสบายตา ไม่ใส่ในกล่องเล็ก
            Expanded(
              child: ListView(
                children: finishedBooks.map((book) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    book,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Color(0xFFFEB0B9),
        child: const Icon(Icons.add,color: Colors.white,),
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => const AddBookScreen(),
          ));
        },
      ),
    );
  }
}

class Book {
  final String id;
  final String title;
  double progress;

  Book({required this.id, required this.title, this.progress = 0.0});
}

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onEdit;

  const BookCard({super.key, required this.book, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),  // เว้นระยะห่างเล็กน้อย
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),  // ขอบมน
      child: Padding(
        padding: const EdgeInsets.all(8),  // padding ให้แคบลง
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title, 
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
                  SizedBox(height: 6),
                  Stack(
                    children: [
                      Container(
                        height: 8,  // แถบ progress เล็กลง
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: book.progress,
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text('${(book.progress * 100).toInt()}% completed',
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit, color: Colors.green),
              onPressed: onEdit,
            ),
          ],
        ),
      ),
    );
  }
}

class AddBookScreen extends StatelessWidget {
  final Book? book;

  const AddBookScreen({super.key, this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book == null ? 'Add New Book' : 'Edit Book'),
      ),
      body: Center(
        child: Text('This page will be used to add/edit book details.'),
      ),
    );
  }
}
class FinishedBookTimeline extends StatelessWidget {
  final List<FinishedBook> finishedBooks = [
    FinishedBook(title: 'Bear', date: 'Feb 10, 2025', rating: 4),
    FinishedBook(title: 'Lion', date: 'Jan 5, 2025', rating: 3),
    FinishedBook(title: 'Giraffe', date: 'Dec 25, 2024', rating: 5),
    FinishedBook(title: 'Penguin', date: 'Nov 30, 2024', rating: 4),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: finishedBooks.length,
      itemBuilder: (context, index) {
        final book = finishedBooks[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Icon(Icons.calendar_today, size: 24, color: Colors.blue[400]),
                  if (index != finishedBooks.length - 1)
                    Container(
                      width: 2,
                      height: 40,
                      color: Colors.blue[200],
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book.date, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    Text(book.title, style: TextStyle(fontSize: 16, color: Colors.black87)),
                    Row(
                      children: List.generate(5, (i) => Icon(
                        i < book.rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 16,
                      )),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class FinishedBook {
  final String title;
  final String date;
  final int rating;

  FinishedBook({required this.title, required this.date, required this.rating});
}
