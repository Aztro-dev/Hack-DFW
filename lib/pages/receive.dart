import 'package:flutter/material.dart';

import 'maps_page.dart';

class Receive extends StatefulWidget {
  const Receive({super.key});

  @override
  State<Receive> createState() => _ReceiveState();
}

class _ReceiveState extends State<Receive> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MapsPage(),
    );
  }
}