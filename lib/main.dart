import 'package:flutter/material.dart';
import 'package:ambrogio/menu_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambrogio',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.red,
      ),
      home: MenuPage(),
    );
  }
}
