import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // FocusNodes สำหรับแต่ละ TextField
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  // ตัวแปรเก็บสถานะว่า TextField ไหนกำลังโฟกัส
  bool isNameFocused = false;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;

  @override
  void initState() {
    super.initState();

    _nameFocus.addListener(() {
      setState(() {
        isNameFocused = _nameFocus.hasFocus;
      });
    });

    _emailFocus.addListener(() {
      setState(() {
        isEmailFocused = _emailFocus.hasFocus;
      });
    });

    _passwordFocus.addListener(() {
      setState(() {
        isPasswordFocused = _passwordFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _nameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // พื้นหลังด้านบน (สีเขียวอ่อน)
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              color: Color(0xFFC5E1A5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),

          // กล่อง Signup Form
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF534684),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ช่องชื่อ
                    TextField(
                      focusNode: _nameFocus,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: isNameFocused
                              ? const Color(0xFFFEB0B9)
                              : const Color(0xFFB3E680),
                        ),
                        hintText: "Full Name",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFB3E680), width: 1.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFFEB0B9), width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ช่อง Email
                    TextField(
                      focusNode: _emailFocus,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: isEmailFocused
                              ? const Color(0xFFFEB0B9)
                              : const Color(0xFFB3E680),
                        ),
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFB3E680), width: 1.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFFEB0B9), width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // ช่อง Password
                    TextField(
                      focusNode: _passwordFocus,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: isPasswordFocused
                              ? const Color(0xFFFEB0B9)
                              : const Color(0xFFB3E680),
                        ),
                        hintText: "Password",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFB3E680), width: 1.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFFEB0B9), width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ปุ่ม Sign Up
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFEB0B9),
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),

                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // กลับไปหน้า Login
                      },
                      child: const Text(
                        "Already have an account? Login",
                        style: TextStyle(color: Color(0xFF534684), decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
