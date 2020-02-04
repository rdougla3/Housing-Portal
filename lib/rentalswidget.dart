import 'package:flutter/material.dart';
import 'package:housing_portal/homecardwidget.dart';

import 'homeviewmodel.dart';

class rentalswidget extends StatefulWidget {
  List<homeviewmodel> homes;
  
  rentalswidget(List<homeviewmodel> homes){
    this.homes = homes;
  }

  @override
  State<StatefulWidget> createState() => _rentalswidgetstate(homes);
}

class _rentalswidgetstate extends State<rentalswidget> {
  List<homeviewmodel> homes;

  _rentalswidgetstate(List<homeviewmodel> homes){
    this.homes = homes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView.builder(
        itemCount: homes.length,
        itemBuilder: (BuildContext context, index) {
          return homecardwidget(homes[index]);
        },
      ),
    ));
  }
}
