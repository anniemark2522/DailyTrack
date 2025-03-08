import 'package:flutter/material.dart';

List<String> mockData = ['1']; // สมมติว่ามีข้อมูลในลิสต์ว่าง (ไม่มีข้อมูล)

class SummarizePage extends StatefulWidget {
  const SummarizePage({super.key});

  @override
  State<SummarizePage> createState() => _SummarizePageState();
}

class _SummarizePageState extends State<SummarizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF9F0),
      appBar: AppBar(
        title: Text(
          "How Today?",
          style: TextStyle(color: Color(0xFF534684), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, size: 25, color: Color(0xFF534684)),
          onPressed: () {
            Navigator.pop(context); // ย้อนกลับไปหน้าก่อนหน้า
          },
        ),
      ),
      body: mockData.isEmpty
          ? Center(
              child: Text(
                "No emotion records yet", // ข้อความเมื่อไม่มีข้อมูล
                style: TextStyle(color: Color(0xFF534684), fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: mockData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      // สี่เหลี่ยมพื้นหลัง
                      Container(
                        height: 150,
                        width: 390,
                        decoration: BoxDecoration(
                          color: Color(0xFF534684),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      // วงกลมที่อยู่ภายในสี่เหลี่ยม (ตรงกลางด้านหน้า)
                      Positioned(
                        top: 30, // ปรับตำแหน่งให้อยู่ตรงกลางแนวตั้งของสี่เหลี่ยม
                        left: 30, // ปรับตำแหน่งให้กึ่งกลางในแนวนอน
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),

                      // ข้อความในสี่เหลี่ยม
                      Positioned(
                        top: 80, // ปรับให้ข้อความอยู่ใต้วงกลม
                        child: Text(
                          mockData[index], // แสดงข้อความจากข้อมูล
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
