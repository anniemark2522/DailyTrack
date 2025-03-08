import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  // ตัวแปรเพื่อเก็บข้อมูลที่กรอก
  TextEditingController field1Controller = TextEditingController();
  TextEditingController field2Controller = TextEditingController();

  bool isField1Editable = true; // กำหนดให้ Field 1 สามารถแก้ไขได้, Field 2 แก้ไขไม่ได้

  // ฟังก์ชั่นสำหรับการบันทึก
  void saveData() {
    // นำข้อมูลจากช่องกรอกไปใช้งาน
    print("Field 1: ${field1Controller.text}");
    print("Field 2: ${field2Controller.text}");
    // เพิ่มการบันทึกข้อมูลที่คุณต้องการที่นี่
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF9F0),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // วงกลมพื้นหลัง
            Transform.translate(
              offset: const Offset(0, -40),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 250.0,
                    height: 250.0,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 243, 178), // สีพื้นหลังวงกลม
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // เพิ่มระยะห่าง
            // ช่องกรอกข้อมูล Field 1
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: field1Controller,
                enabled: isField1Editable, // กำหนดว่า Field 1 สามารถแก้ไขได้หรือไม่
                decoration: InputDecoration(
                  labelText: 'Field 1',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            // ช่องกรอกข้อมูล Field 2 ที่ไม่สามารถแก้ไขได้
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: field2Controller,
                readOnly: true, // กำหนดให้ไม่สามารถแก้ไขได้
                decoration: InputDecoration(
                  labelText: 'Field 2',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            // ปุ่ม Save
            ElevatedButton(
              onPressed: saveData,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF534684), // สีของปุ่ม
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
