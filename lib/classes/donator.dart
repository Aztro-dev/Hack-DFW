import 'package:google_maps_flutter/google_maps_flutter.dart';

class Donator {
  // Basic Information for a Donator
  String info = "";
  String name = "";
  LatLng location = new LatLng(0.0, 0.0);

  Donator(String info, LatLng location, String name) {
    this.info = info;
    this.location = location;
    this.name = name;
  }

  Map<String, dynamic> toJson() => {
        'Text': name,
        'Additional Info': info,
        'Position': location,
      };
}

Set<Marker> donors = {};

void addDonor(Marker donor) {
  donors.add(donor);
}
