import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PopupMenu extends StatefulWidget {
  // PopupMenu({Key key, LatLng lastMapPosition}) : super(key: key);
  final LatLng lastMapPosition;
  final Set<Marker> markers;
  PopupMenu({Key key, @required LatLng lastMapPosition, Set<Marker> markers})
      : assert(lastMapPosition != null),
        lastMapPosition = lastMapPosition,
        markers = markers,
        super(key: key);

  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  Color myColor = Colors.redAccent;
  double slideValue;
  double min = 1.0;
  double max = 10.0;

  TextEditingController descriptionController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  List<DropdownMenuItem> menuItems = [
    DropdownMenuItem(
      value: BitmapDescriptor.hueGreen,
      child: Text('good'),
    ),
    DropdownMenuItem(
      value: BitmapDescriptor.hueYellow,
      child: Text('alert'),
    ),
    DropdownMenuItem(
      value: BitmapDescriptor.hueOrange,
      child: Text('danger'),
    ),
  ];

  Future<Marker> _onAddMarkerButtonPressed(
      double color, String title, String description) async {
    print(
        "marker: ${widget.lastMapPosition.toString()}, $color, $description ");
    return Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(widget.lastMapPosition.toString()),
      position: widget.lastMapPosition,
      infoWindow: InfoWindow(
        title: title,
        snippet: description,
      ),
      // icon: BitmapDescriptor.defaultMarker,
      icon: BitmapDescriptor.defaultMarkerWithHue(color),
      // BitmapDescriptor.fromAsset(‘assets/asset_name.png),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: 'add_marker_button',
        onPressed: openAlertBox,
        backgroundColor: myColor,
        child: Icon(Icons.add_location));
  }

  Future<void> openAlertBox() async {
    double color = BitmapDescriptor.hueRed;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: const EdgeInsets.only(top: 10.0),
            content: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Add Marker',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                        items: menuItems,
                        hint: Text('Select Report Type'),
                        onChanged: (value) {
                          print('value: ' + value.toString());
                          color = value;
                        },
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        border: InputBorder.none,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        border: InputBorder.none,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Marker marker = await _onAddMarkerButtonPressed(color,
                          titleController.text, descriptionController.text);
                      widget.markers.add(marker);
                      titleController.clear();
                      descriptionController.clear();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: myColor,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(32.0),
                            bottomRight: Radius.circular(32.0)),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
