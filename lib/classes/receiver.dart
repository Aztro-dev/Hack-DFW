import 'package:google_maps_flutter/google_maps_flutter.dart';

class Receiver {
  // Basic Information for a Donator
  String name;
  LatLng location;
  bool shareWithDonator;

  Receiver(this.name, this.location, this.shareWithDonator);
}

Set<Marker> receivers = {};

void addReceiver(Marker receiver) {
  receivers.add(receiver);
}
