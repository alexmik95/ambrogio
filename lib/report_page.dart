import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  ReportPage({Key key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Report Something',
            style: TextStyle(fontSize: 30),
          ),
          backgroundColor: Colors.purple[200],
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Title',
                style: TextStyle(fontSize: 30),
              ),
              Divider(
                height: 10,
                color: Colors.white,
              ),
              Text(
                'Type',
                style: TextStyle(fontSize: 30),
              ),
              Divider(
                height: 10,
                color: Colors.white,
              ),
              Text(
                'Brief Description',
                style: TextStyle(fontSize: 30),
              ),
              Divider(
                height: 10,
                color: Colors.white,
              ),
              Text(
                'Attachments',
                style: TextStyle(fontSize: 30),
              ),
              Divider(
                height: 10,
                color: Colors.white,
              ),
              Text(
                'Location',
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
        ));
  }
}
