import 'package:flutter/material.dart';
import 'package:mentalify/navbar.dart';

class MentalTest extends StatefulWidget {
  const MentalTest({super.key});

  @override
  State<MentalTest> createState() => _MentalTestState();
}

class _MentalTestState extends State<MentalTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),);
  }
}
