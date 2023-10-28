import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:screl_interview/model/model_class.dart';


class UserLocationMap extends StatelessWidget {
  final Address address;

  UserLocationMap({required this.address});

  @override
  Widget build(BuildContext context) {
    // Create a LatLng object with the user's location coordinates
    final LatLng userLocation = LatLng(
      double.parse(address.geo.lat),
      double.parse(address.geo.lng),
    );

    // Create a GoogleMap widget with a marker at the user's location
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: userLocation,
        zoom: 15.0, // Adjust the zoom level as needed
      ),
      markers: {
        Marker(
          markerId: MarkerId('UserLocationMarker'),
          position: userLocation,
          infoWindow: InfoWindow(
            title: 'User Location',
          ),
        ),
      },
    );
  }
}
