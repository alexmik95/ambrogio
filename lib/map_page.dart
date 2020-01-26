import 'dart:async';
import 'package:ambrogio/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key}) : super(key: key);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  // TODO: _center should be setted to preferred city or last position recorded.
  static const LatLng _center = const LatLng(41.8919300, 12.5113300); // Rome

  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
        Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title: 'No elevator',
            snippet: 'To avoid',
          ),
          // icon: BitmapDescriptor.defaultMarker,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
          // BitmapDescriptor.fromAsset(‘assets/asset_name.png),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Accessibility Map',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.green[200],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              indoorViewEnabled: true,
              buildingsEnabled: true,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
          ),
          Center(
            child: Icon(
              Icons.control_point,
              color: Colors.redAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: PopupMenu(
                  lastMapPosition: _lastMapPosition, markers: _markers),
            ),
          ),
        ],
      ),
    );
  }
}
