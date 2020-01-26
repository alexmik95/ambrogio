import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: Colors.amber[200],
      ),
      body: Center(
        child: Text(
          'Settings',
          style: TextStyle(fontSize: 50, color: Colors.amber[200]),
        ),
      ),
    );
  }
}
