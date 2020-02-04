import 'package:flutter/material.dart';
import 'package:housing_portal/homeviewmodel.dart';

import 'homecardwidget.dart';

class savedwidget extends StatefulWidget {
  List<homeviewmodel> homes;

  savedwidget(List<homeviewmodel> homes){
    this.homes = homes;
  }

  @override
  State<StatefulWidget> createState() => _savedwidgetstate(homes);
}

class _savedwidgetstate extends State<savedwidget> {
  List<homeviewmodel> homes;

  _savedwidgetstate(List<homeviewmodel> homes){
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
