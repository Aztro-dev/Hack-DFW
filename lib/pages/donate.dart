import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/pages/maps_page.dart';
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
                const Icon(
                  Icons.android,
                  size: 100,
                ),
                const SizedBox(height: 75),
                const Text(
                  'Welcome!',
                  style: TextStyle(
                    fontSize: 52,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Enter any infomation about your donation",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: "Name of location",
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
                      if (_nameController.text.isNotEmpty) {
                        addDonor(
                          Marker(
                            markerId: MarkerId(
                              currentLocation.toString(),
                            ),
                            position: currentLocation,
                            infoWindow: InfoWindow(
                              title: _nameController.text.trim(),
                              snippet: _additionalInfoController.text.trim(),
                            ),
                          ),
                        );
                        final dono = Donator(
                          _additionalInfoController.text,
                          currentLocation,
                          _nameController.text,
                        );
                        createDonor(dono);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MapsPage()),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent[100],
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

    // ignore: avoid_print
    print("FirebaseFirestore.instance.collection('Markers')" +
        collection.toString());

    var collectionDoc = collection.doc('go');

    print("FirebaseFirestore.instance.collection('Markers')" +
        collectionDoc.toString());
    await collection.doc('go').set(json);

    //await docUser.set(json);
  }
}
