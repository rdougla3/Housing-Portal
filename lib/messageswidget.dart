import 'package:flutter/material.dart';

class messageswidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _messageswidgetstate();
}

class _messageswidgetstate extends State<messageswidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Messages'),
      ),
      body: Text('Your Messages'),
    );
  }
}
