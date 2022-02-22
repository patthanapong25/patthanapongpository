import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/app/wat.dart';
import 'package:flutter_auth/Screens/app/home.dart';

class DrawerManu extends StatefulWidget {
  @override
  _DrawerManuState createState() => _DrawerManuState();
}

class _DrawerManuState extends State<DrawerManu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("นาย พัฒนพงศ์ บุญเอนก"),
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(
                size: 50.0,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('หน้าแรก'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Welcome()));
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_outlined),
            title: const Text('ชื่อวัด'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => wat()));
            },
          ),
        ],
      ),
    );
  }
}
