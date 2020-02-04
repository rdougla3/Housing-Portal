import 'package:flutter/material.dart';

class explorewidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _explorewidgetstate();
}

class _explorewidgetstate extends State<explorewidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Explore'),
      ),
      body: 
      Padding(padding: EdgeInsets.all(5),
      child: TextField(
        controller: TextEditingController(),
        decoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Search for an address, city, ZIP, or neighborhood',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
        ),
      ),)
    );
  }
}
