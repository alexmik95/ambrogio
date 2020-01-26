import 'package:ambrogio/latest_page.dart';
import 'package:ambrogio/map_page.dart';
import 'package:ambrogio/report_page.dart';
import 'package:ambrogio/settings_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  navigateToReport() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => ReportPage()));

  navigateToMap() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => MapPage()));

  navigateToLatest() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => LatestPage()));

  navigateToSettings() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => SettingsPage()));

  menuButton(String title, IconData icon, Color color, Function action) =>
      MaterialButton(
        // height: 200,
        height: (MediaQuery.of(context).size.height - 80) * 0.5,
        minWidth: MediaQuery.of(context).size.width * 0.5,
        color: color,
        onPressed: action,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Container(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Welcome in Ambrogio',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.red[300],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  menuButton('Report', Icons.add_comment, Colors.purple[200],
                      navigateToReport),
                  menuButton('Navigate', Icons.navigation, Colors.green[200],
                      navigateToMap),
                ],
              ),
              Row(
                children: <Widget>[
                  menuButton('Latest', Icons.update, Colors.blue[200],
                      navigateToLatest),
                  menuButton('Settings', Icons.settings, Colors.amber[200],
                      navigateToSettings),
                ],
              ),
              /*
              RaisedButton.icon(
                icon: Icon(Icons.add_comment, color: Colors.white),
                label: Text(
                  'Report',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReportPage()));
                },
                color: Colors.purple[200],
              ),
              Divider(
                height: 10,
                color: Colors.white,
              ),
              RaisedButton.icon(
                icon: Icon(Icons.map, color: Colors.white),
                label: Text(
                  'Explore',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapPage()));
                },
                color: Colors.green[200],
              ),
              Divider(
                height: 10,
                color: Colors.white,
              ),
              RaisedButton.icon(
                icon: Icon(Icons.update, color: Colors.white),
                label: Text(
                  'Latest',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                onPressed: () {},
                color: Colors.blue[200],
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}
