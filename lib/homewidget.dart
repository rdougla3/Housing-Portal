import 'package:flutter/material.dart';

import 'package:housing_portal/rentalswidget.dart';
import 'package:housing_portal/propertieswidget.dart';
import 'package:housing_portal/savedwidget.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'homeviewmodel.dart';

List<homeviewmodel> rentals = [
  new homeviewmodel("323 E. Veterans Way", "Scion", 123, 'Rented',
      'university-house.jpg', false, false, false),
];
List<homeviewmodel> saved = [
  new homeviewmodel("12600 N. 103rd Pl.", "Neil Douglas", 123, 'Listed',
      'house.jpg', false, false, false),
  new homeviewmodel("12600 N. 103rd Pl.", "Neil Douglas", 123, 'Listed',
      'house.jpg', false, false, false),
  new homeviewmodel("12600 N. 103rd Pl.", "Neil Douglas", 123, 'Listed',
      'house.jpg', false, false, false),
  new homeviewmodel("12600 N. 103rd Pl.", "Neil Douglas", 123, 'Listed',
      'house.jpg', false, false, false),
  new homeviewmodel("12600 N. 103rd Pl.", "Neil Douglas", 123, 'Listed',
      'house.jpg', false, false, false),
  new homeviewmodel("12600 N. 103rd Pl.", "Neil Douglas", 123, 'Listed',
      'house.jpg', false, false, false),
  new homeviewmodel("12600 N. 103rd Pl.", "Neil Douglas", 123, 'Listed',
      'house.jpg', false, false, false),
  new homeviewmodel("12600 N. 103rd Pl.", "Neil Douglas", 123, 'Listed',
      'house.jpg', false, false, false),
];
List<homeviewmodel> properties = [
  new homeviewmodel("12600 N. 103rd Pl.", "Neil Douglas", 123, 'Listed',
      'house.jpg', false, false, false),
  new homeviewmodel("721 W. 13th Street", "Neil Douglas", 123, 'Rented',
      'house.jpg', false, false, false),
];

class homewidget extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _homewidgetstate();
}

class _homewidgetstate extends State<homewidget> {
  final tab = new TabBar(tabs: <Tab>[
    new Tab(
      text: 'RENTALS',
    ),
    new Tab(
      text: 'SAVED',
    ),
    new Tab(
      text: 'PROPERTIES',
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: tab,
          title: Text('Home'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: TabBarView(
          children: [
            rentalswidget(rentals),
            savedwidget(saved),
            propertieswidget(),
          ],
        ),
      ),
    ));
  }
}
