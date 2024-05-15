import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(padding: EdgeInsets.zero,
      children: [UserAccountsDrawerHeader(accountName:Text("Guest User"), accountEmail: Text("sample@akgec.ac.in"),currentAccountPicture: CircleAvatar(child: ClipOval(child: Image.asset("assets/images/profile.png"),),
      ),decoration: BoxDecoration(
        color: Colors.indigo[400]
      ),),
      ListTile(leading: Icon(Icons.align_vertical_bottom),
      title: Text("Take online mental test"),
      onTap: () {},),
        ListTile(leading: Icon(Icons.add),
          title: Text("Connect with our experts"),
          onTap: () {},),
        ListTile(leading: Icon(Icons.bookmark_border),
          title: Text("Stress busters"),
          onTap: () {},),
        ListTile(leading: Icon(Icons.star),
          title: Text("About us"),
          onTap: () {},)],
    ),);
  }
}
