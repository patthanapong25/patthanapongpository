import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/app/manu.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าหลัก'),
      ),
      drawer: DrawerManu(),
      body: Background(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: Align(
                child: Text(
                  "วัดจังหวัดศรีสะเกษ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
              child: Align(
                child: Text(
                    "จัดทำโดย นาย พัฒนพงศ์ บุญเอนก นักศึกษาสาขาวิทยาการคอมพิวเตอร์ มหาวิทยาลัยราชภัฏศรีสะเกษ"),
              ),
            ),
            Card(
              child: Image.network(
                  'https://www.diyinspirenow.com/wp-content/uploads/2020/12/FI_%E0%B8%A7%E0%B8%B1%E0%B8%94%E0%B8%94%E0%B8%B1%E0%B8%87%E0%B8%A8%E0%B8%A3%E0%B8%B5%E0%B8%AA%E0%B8%B0%E0%B9%80%E0%B8%81%E0%B8%A9-min.jpg'),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.all(10),
            ),
          ],
        ),
      ),
    );
  }
}
