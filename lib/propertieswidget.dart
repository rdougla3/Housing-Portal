import 'package:flutter/material.dart';
import 'package:housing_portal/propertycardwidget.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';



import 'addwidget.dart';
import 'homecardwidget.dart';
import 'homeviewmodel.dart';

class propertieswidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _propertieswidgetstate();
}

class _propertieswidgetstate extends State<propertieswidget> {
 
  Future<List<homeviewmodel>> _getHomes() async {
    var data = await http
        .get("http://www.json-generator.com/api/json/get/cfTtutTOYy?indent=2");

    var jsonData = json.decode(data.body);

    List<homeviewmodel> homes = [];

    for (var h in jsonData) {
      homeviewmodel home = homeviewmodel(
          h["address"],
          h["owner"],
          h["rent"],
          h["status"],
          h["imageSource"],
          h["rental"],
          h["saved"],
          h["property"]);
      homes.add(home);
    }
    
    print(homes.length);

    return homes;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getHomes(),
        builder: (context, snapshot) {
          if(snapshot.data == null){
            return Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('Loading'),
                    Icon(Icons.system_update),
                  ],
                ),
                )
            );
          }
          return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  homeviewmodel home = new homeviewmodel(snapshot.data[index].address, snapshot.data[index].owner, snapshot.data[index].rent, snapshot.data[index].status, snapshot.data[index].imageSource, snapshot.data[index].rental, snapshot.data[index].saved, snapshot.data[index].property);
                  return propertycardwidget(home);
                },
              );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => addwidget(null)),
                      );},
      ),
    );
  }
}
