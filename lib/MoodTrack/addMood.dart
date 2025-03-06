import 'package:flutter/material.dart';

class Addmood extends StatefulWidget {
  const Addmood({super.key});

  @override
  State<Addmood> createState() => _AddmoodState();
}

class _AddmoodState extends State<Addmood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('add mood'),
    );
  }
}