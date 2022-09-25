import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../classes/donator.dart';

class Donate extends StatefulWidget {
  const Donate({super.key});

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  late TextEditingController _nameController;
  late TextEditingController _additionalInfoController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _additionalInfoController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _additionalInfoController.dispose();
    super.dispose();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(value: "Food", child: Text("Food")),
      DropdownMenuItem(value: "Clothes", child: Text("Clothes")),
      DropdownMenuItem(value: "Toys", child: Text("Toys")),
    ];
    return menuItems;
  }

  String selectedValue = "Food";

  LatLng currentLocation = const LatLng(32.776665, -96.796989);

  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 52,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Select what you would like to donate",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                DropdownButton(
                  value: selectedValue,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: dropdownItems,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: TextField(
                    controller: _additionalInfoController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Additional Info",
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      addDonor(
                        Marker(
                          markerId: MarkerId(
                            currentLocation.toString(),
                          ),
                          position: currentLocation,
                          infoWindow: InfoWindow(
                            title: selectedValue,
                            snippet: _additionalInfoController.text.trim(),
                          ),
                        ),
                      );
                      final dono = Donator(
                        _additionalInfoController.text,
                        currentLocation,
                        selectedValue,
                      );
                      createDonor(dono);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 390,
                  width: double.infinity,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: currentLocation,
                      zoom: 12,
                    ),
                    onMapCreated: (controller) {
                      mapController = controller;
                    },
                    markers: donors,
                    onTap: (position) {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future createDonor(Donator dono) async {
    final json = dono.toJson();

    var collection = FirebaseFirestore.instance.collection('Markers');
    await collection.doc('go').set(json);

    //await docUser.set(json);
  }
}
