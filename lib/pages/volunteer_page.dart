// ignore: file_names
import 'package:flutter/material.dart';
import 'package:untitled/pages/maps_page.dart';

class VolunteerPage extends StatefulWidget {
  const VolunteerPage({super.key});

  @override
  State<VolunteerPage> createState() => _VolunteerPageState();
}

class _VolunteerPageState extends State<VolunteerPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 781,
          child: MapsPage(),
        ),
      ],
    );
  }
}
