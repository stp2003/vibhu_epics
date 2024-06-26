import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  static const LatLng destination = LatLng(23.0709, 76.8317);
  static const LatLng sourceLocation = LatLng(23.0775, 76.8513);

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Track Order",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: sourceLocation,
          zoom: 13.5,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("source"),
            icon: sourceIcon,
            position: sourceLocation,
          ),
          Marker(
            markerId: const MarkerId("destination"),
            icon: destinationIcon,
            position: destination,
          ),
        },
      ),
    );
  }
}
