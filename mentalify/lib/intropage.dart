import 'package:flutter/material.dart';
import 'package:mentalify/navbar.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 80.0, left: 80, bottom: 40, top: 100),
            child: Image.asset("assets/images/happiness.png"),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "To find inner peace bring changes inside you, in turn, things will change around you.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: Colors.indigo[400],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.all(24.0),
            child: Text(
              "Get Started",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
