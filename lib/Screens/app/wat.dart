import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:http/http.dart' as Http;

class wat extends StatefulWidget {
  @override
  _watState createState() => _watState();
}

class _watState extends State<wat> {
  var jsonData;
  List<TempleData> dataList = [];
  // ignore: non_constant_identifier_names
  Future<String> _GetData() async {
    var response = await Http.get(Uri.parse(
        'https://numvarn.github.io/resume/asset/files/templeprofile.json'));
    jsonData = json.decode(utf8.decode(response.bodyBytes));

    for (var data in jsonData) {
      TempleData news = TempleData(
          data['ชื่อ'], data['พระเกจิ'], data['ละติจูด'], data['ลองติจูด']);
      dataList.add(news);
    }

    return 'ok';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ชื่อวัด'),
      ),
      body: Background(
          child: FutureBuilder(
        future: _GetData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Align(
                          child: Text(
                            '${dataList[index].name}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      
                      Container(
                        margin: EdgeInsets.all(15),
                        child: Align(
                          child: Text(
                            '${dataList[index].monk}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Align(
                          child: Text(
                            '${dataList[index].latitude}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                        child: Align(
                          child: Text(
                            '${dataList[index].longtitude}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Container(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}

class TempleData {
  String name;
  String monk;
  double latitude;
  double longtitude;
  TempleData(this.name, this.monk, this.latitude, this.longtitude);
}
