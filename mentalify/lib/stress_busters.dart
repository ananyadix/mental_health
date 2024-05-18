import 'package:flutter/material.dart';
import 'package:mentalify/navbar.dart';

class StressBusters extends StatefulWidget {
  const StressBusters({super.key});

  @override
  State<StressBusters> createState() => _StressBustersState();
}

class _StressBustersState extends State<StressBusters> {
  List<List<dynamic>> exercise = [
    ['Exercise', Colors.blueAccent[50], "assets/images/running.png"],
    ['Play Sports', Colors.pinkAccent[50], "assets/images/offensive.png"],
    ['Meditate', Colors.greenAccent[50], "assets/images/yoga.png"],
    ['Connect with other people', Colors.purpleAccent[50], "assets/images/network.png"],
    ['Listening Music', Colors.blueAccent[50], "assets/images/man (3).png"],
    ['Living near nature', Colors.pinkAccent[40], "assets/images/planet-earth.png"],
    ['Spending time with pets', Colors.greenAccent[50], "assets/images/animal-care.png"],
    ['Writing your thoughts', Colors.purpleAccent[50], "assets/images/writing.png"]
  ];

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Come and learn some new exercises to improve your mental health:",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: exercise.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: exercise[index][1],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Image.asset(
                            exercise[index][2],
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(width: 16),
                          Text(
                            exercise[index][0],
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





