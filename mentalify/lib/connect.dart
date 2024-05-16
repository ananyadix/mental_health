import 'package:flutter/material.dart';
import 'package:mentalify/navbar.dart'; // Import the NavBar widget

class ConnectWith extends StatefulWidget {
  const ConnectWith({Key? key}) : super(key: key);

  @override
  State<ConnectWith> createState() => _ConnectWithState();
}

class _ConnectWithState extends State<ConnectWith> {
  final List<String> experts = [
    'Dr. Preetika',
    'Dr Vinay Arora',
    'Dr S.K. Jain',
    'Dr R.K. Aggarwal',
    'Dr Neetu Sharma',
    'Dr Premlata',
    'Dr J.K. Arora',
    'Dr Sanjay Sharma',
    'Dr Neetu Sharma',
    'Dr Seema Bagha',
    'Sharma Ji',
    'Dr Manoj Kumar',
    'Dr Yogendra Prajapati'
  ];
  final experince = [
    "10+ years of experience",
    "8+ years of experience",
    "13+ years of experience",
    "5+ years of experience",
    "7+ years of experience",
    "15+ years of experience",
    "13+ years of experience",
    "8+ years of experience",
    "21+ years of experience",
    "15+ years of experience",
    "10+ years of experience",
    "11+ years of experience",
    "9+ years of experience"
  ];
  final img=["assets/images/woman.png",
    "assets/images/agent.png",
    "assets/images/man-avatar.png",
    "assets/images/man.png",
    "assets/images/profile (1).png",
    "assets/images/profile (2).png",
    "assets/images/man (1).png",
    "assets/images/man (2).png",
    "assets/images/girl.png",
    "assets/images/woman (1).png",
    "assets/images/profile.png",
    "assets/images/man.png",
    "assets/images/man (1).png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(), // Add the NavBar widget here
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.separated(
        itemCount: experts.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.asset(img[index]),
            title: Text(experts[index]),
            subtitle: Text(experince[index]),
            trailing: Icon(Icons.add),
          );
        },
      ),
    );
  }
}


