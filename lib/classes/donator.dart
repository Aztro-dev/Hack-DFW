import 'package:google_maps_flutter/google_maps_flutter.dart';

class Donator {
  // Basic Information for a Donator
  String info = "";
  String name = "";
  LatLng location = const LatLng(0.0, 0.0);

  Donator(this.info, this.location, this.name);

  Map<String, dynamic> toJson() => {
        'Text': name,
        'Additional Info': info,
        'Position': location,
      };
}

LatLng currentLocation = const LatLng(32.776665, -96.796989);
LatLng currentLocation1 = const LatLng(33.0, -97);
LatLng currentLocation2 = const LatLng(31.776665, -96.596989);
LatLng currentLocation3 = const LatLng(32.0, -96.496989);

Set<Marker> donors = {
  Marker(
    markerId: MarkerId(
      currentLocation.toString(),
    ),
    position: currentLocation,
  ),
  Marker(
    markerId: MarkerId(
      currentLocation1.toString(),
    ),
    position: currentLocation1,
  ),
  Marker(
    markerId: MarkerId(
      currentLocation2.toString(),
    ),
    position: currentLocation2,
  ),
  Marker(
    markerId: MarkerId(
      currentLocation3.toString(),
    ),
    position: currentLocation3,
  ),
};

void addDonor(Marker donor) {
  donors.add(donor);
}
