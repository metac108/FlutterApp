import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Position currentLocation;
  double latitude,longitude;
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(0.0, 0.0)
  );

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude=position.latitude.toDouble();
    longitude=position.longitude.toDouble();
    _goToTheLake();
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition _kLake = CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 19.151926040649414
    );
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    markers.addAll([
      Marker(
          markerId: MarkerId('value'),
          infoWindow: InfoWindow(
              title: "Test1"),
          position: LatLng(latitude,longitude))
    ]);
  }
  Set<Marker> markers = Set();

  @override
  Widget build(BuildContext context) {
    Widget drawerMap = Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.power, color: Color(0xFF4DC0B6)),
                  title: Text(
                    "Shutdown Device",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF141420),
        scaffoldBackgroundColor: Color(0xFF141420),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: markers,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: FloatingActionButton(
            child: Icon(Icons.location_searching),
            onPressed: () => {
              getLocation(),
            },
            backgroundColor: Color(0xFF4DC0B6),
          ),
        ),
      ),
    );
  }
}