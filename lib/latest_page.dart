import 'package:flutter/material.dart';

class LatestPage extends StatefulWidget {
  LatestPage({Key key}) : super(key: key);

  @override
  _LatestPageState createState() => _LatestPageState();
}

class _LatestPageState extends State<LatestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Latest Reports',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        backgroundColor: Colors.blue[200],
      ),
      body: Center(
        child: Text(
          'Reports List',
          style: TextStyle(fontSize: 50, color: Colors.blue[200]),
        ),
      ),
    );
  }
}
