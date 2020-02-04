import 'package:flutter/material.dart';
import 'package:housing_portal/editwidget.dart';

import 'homeviewmodel.dart';

class propertycardwidget extends StatefulWidget {
  homeviewmodel home;

  propertycardwidget(homeviewmodel home) {
    this.home = home;
  }
  @override
  State<StatefulWidget> createState() => _propertycardwidgetstate(home);
}

class _propertycardwidgetstate extends State<propertycardwidget> {
  homeviewmodel home;
  _propertycardwidgetstate(homeviewmodel home) {
    this.home = home;
  }

  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [home.saved];
    return Center(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                  leading: Image(image: NetworkImage(home.imageSource)),
                  title: Text(home.address),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Owner: ' + home.owner),
                      Text('Rent: \$' + home.rent.toString())
                    ],
                  )),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: Icon(Icons.view_compact),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => editwidget(home)),
                      );
                    },
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
                      color: Colors.grey),
                  FlatButton(
                    child: Icon(Icons.share),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
