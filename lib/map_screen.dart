import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _cairo = const LatLng(30.033333, 31.233334);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _cairo,
          zoom: 10.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('cairo'),
            position: _cairo,
            infoWindow: InfoWindow(
              title: 'Cairo',
              snippet: 'Capital of Egypt',
            ),
          ),
        },
      ),
    );
  }
}
