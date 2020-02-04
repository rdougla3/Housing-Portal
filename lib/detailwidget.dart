import 'package:flutter/material.dart';
import 'package:housing_portal/homeviewmodel.dart';

class detailwidget extends StatefulWidget {
  homeviewmodel home;
  detailwidget(homeviewmodel home) {
    this.home = home;
  }

  @override
  State<StatefulWidget> createState() => _detailwidgetstate(home);
}

class _detailwidgetstate extends State<detailwidget> {
  @override
  homeviewmodel home;
  _detailwidgetstate(homeviewmodel home) {
    this.home = home;
  }
  Widget build(BuildContext context) {
    List<bool> isSelected = [home.saved];
    return Scaffold(
      appBar: AppBar(
        title: Text(home.address),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () => {},
          ),
          ToggleButtons(
            children: <Widget>[Icon(Icons.bookmark)],
            onPressed: (int index) {
              setState(() {
                home.saved = !home.saved;
              });
            },
            isSelected: isSelected,
            renderBorder: false,
            color: Colors.white,
            selectedColor: Colors.black,
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => {},
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: AssetImage('assets/' + home.imageSource)),
            ),
            DataTable(
              columns: [
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
            ], rows: [
              DataRow(cells: [
                DataCell(Text('Address')),
                DataCell(Text(home.address)),
              ]),
              DataRow(cells: [
                DataCell(Text('Owner')),
                DataCell(Text(home.owner)),
              ]),
              DataRow(cells: [
                DataCell(Text('Asking Rent')),
                DataCell(Text('\$' + home.rent.toString())),
              ]),
              DataRow(cells: [
                DataCell(Text('Status')),
                DataCell(Text(home.status)),
              ]),
            ])
          ],
        ),
      ),
    );
  }
}
