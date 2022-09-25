import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../classes/donator.dart';

LatLng currentLocation = new LatLng(32.776665, -96.796989);

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 12,
        ),
        onMapCreated: (controller) {
          mapController = controller;
        },
        markers: getDonors(),
        onTap: (position) {});
  }

  Set<Marker> getDonors() {
    return donors;
  }
}
