import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'maps_page.dart';

class Receive extends StatefulWidget {
  const Receive({super.key});

  @override
  State<Receive> createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
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
                  "Select what you would like to receive",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                DropdownButton(
                  value: selectedValue,
                  style: const TextStyle(color: Colors.black, fontSize: 30),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: dropdownItems,
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 550,
                  width: double.infinity,
                  child: MapsPage(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
