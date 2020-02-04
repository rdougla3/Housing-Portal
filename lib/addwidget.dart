import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:housing_portal/homeviewmodel.dart';

class addwidget extends StatefulWidget {
  List<homeviewmodel> homes;
  addwidget(homes) {
    this.homes = homes;
  }
  @override
  State<StatefulWidget> createState() => _addwidgetstate(homes);
}

class _addwidgetstate extends State<addwidget> {
  List<homeviewmodel> homes;

  _addwidgetstate(homes) {
    this.homes = homes;
  }

  TextEditingController _textEditingController = TextEditingController();
  String address = 'New Home';
  String owner = 'Neil Douglas';
  double rent = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('New Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              homes.add(new homeviewmodel(address, owner, rent, 'Listed',
                  'house.jpg', false, false, true));
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add_photo_alternate),
              onPressed: () {},
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Enter an Address'),
                  onChanged: (input) {
                    address = input;
                  },
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(labelText: 'Enter Asking Rent'),
                  onChanged: (input) {
                    rent = double.parse(input.toString());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
