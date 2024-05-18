import 'package:flutter/material.dart';
import 'package:mentalify/mental_test.dart';
import 'package:mentalify/connect.dart';
import 'package:mentalify/stress_busters.dart';
import 'package:mentalify/about.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Guest User"),
            accountEmail: Text("sample@akgec.ac.in"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset("assets/images/profile.png"),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.indigo[400],
            ),
          ),
          ListTile(
            leading: Icon(Icons.align_vertical_bottom),
            title: Text("Take online mental test"),
            onTap: () {
              setState(() {
                index = 1;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MentalTest())
              );
              // Close the drawer after selection
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Connect with our experts"),
            onTap: () {
              setState(() {
                index = 2; // Set index to 2 for "ConnectWith" screen
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConnectWith()), // Push ConnectWith screen
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark_border),
            title: Text("Stress busters"),
            onTap: () {
              setState(() {
                index = 3;
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) => StressBusters()),);
              // Close the drawer after selection
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("About us"),
            onTap: () {
              setState(() {
                index = 4;
              });
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUs()),);
              // Close the drawer after selection
            },
          ),
        ],
      ),
    );
  }
}

