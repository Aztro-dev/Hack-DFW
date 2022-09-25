import 'package:flutter/material.dart';
import 'package:untitled/pages/main_login_page.dart';
import 'package:untitled/pages/receive.dart';

// ignore: depend_on_referenced_packages
import 'package:location/location.dart';
import 'package:untitled/pages/volunteer_PAGE.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: non_constant_identifier_names
  Future<dynamic> GetLocationAccess() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    // ignore: unused_local_variable
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
  }

  final Uri _volunteerUrl =
      Uri.parse("https://tamuc.co1.qualtrics.com/jfe/form/SV_3CtXsNQWPEfj8gu");
  /*final Uri _donorUrl =
      Uri.parse("https://tamuc.co1.qualtrics.com/jfe/form/SV_2bGAr7mqJ5QwG2y");
  final Uri _seekerUrl =
      Uri.parse("https://tamuc.co1.qualtrics.com/jfe/form/SV_2bGAr7mqJ5QwG2y");
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Let's Leave an Impact on Each Other's Lives!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        backgroundColor: Colors.greenAccent[100],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Image(
              height: 200,
              image: AssetImage("assets/images/ImpactDFW.jpeg"),
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: FloatingActionButton(
                  onPressed: () {
                    GetLocationAccess();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainLoginPage()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.greenAccent[100],
                  foregroundColor: Colors.black,
                  child: const Text(
                    "I want to donate",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: FloatingActionButton(
                  onPressed: () {
                    GetLocationAccess();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Receive()),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.greenAccent[100],
                  foregroundColor: Colors.black,
                  child: const Text(
                    "I want to seek",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: 300,
                height: 100,
                child: FloatingActionButton(
                  onPressed: () {
                    GetLocationAccess();
                    _launchUrl(_volunteerUrl);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VolunteerPage(),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.greenAccent[100],
                  foregroundColor: Colors.black,
                  child: const Text(
                    "I want to volunteer",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
