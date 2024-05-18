import 'package:flutter/material.dart';
import 'package:mentalify/navbar.dart';

class StressBusters extends StatefulWidget {
  const StressBusters({super.key});

  @override
  State<StressBusters> createState() => _StressBustersState();
}

class _StressBustersState extends State<StressBusters> {
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
