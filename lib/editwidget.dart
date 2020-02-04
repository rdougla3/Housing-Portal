import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:housing_portal/homeviewmodel.dart';

class editwidget extends StatefulWidget {
  homeviewmodel home;
  editwidget(homeviewmodel home) {
    this.home = home;
  }

  @override
  State<StatefulWidget> createState() => _editwidgetstate(home);
}

class _editwidgetstate extends State<editwidget> {
  @override
  homeviewmodel home;
  String address;
  double rent;

  _editwidgetstate(homeviewmodel home) {
    this.home = home;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(home.address),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: NetworkImage(home.imageSource)),
            ),
            IconButton(
              icon: Icon(Icons.add_photo_alternate),
              onPressed: () {},
            ),
            DataTable(columns: [
              DataColumn(label: Text('')),
              DataColumn(label: Text('')),
            ], rows: [
              DataRow(cells: [
                DataCell(Text('Address')),
                DataCell(Text(home.address),
                    showEditIcon: true, onTap: _showAddressDialog),
              ]),
              DataRow(cells: [
                DataCell(Text('Owner')),
                DataCell(Text(home.owner)),
              ]),
              DataRow(cells: [
                DataCell(Text('Asking Rent')),
                DataCell(Text('\$' + home.rent.toString()),
                    showEditIcon: true, onTap: _showRentDialog),
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

  void _showAddressDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Edit Address"),
          content: new TextFormField(
            decoration: InputDecoration(labelText: 'Enter an Address'),
            onChanged: (input) {
              address = input;
            },
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Save"),
              onPressed: () {
                setState(() {
                  home.address = address;
                });
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showRentDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Edit Rent"),
          content: new TextFormField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(labelText: 'Enter Asking Rent'),
            onChanged: (input) {
              rent = double.parse(input.toString());
            },
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Save"),
              onPressed: () {
                setState(() {
                  home.rent = rent;
                });
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
