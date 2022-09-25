import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/login_page.dart';

import 'donate.dart';

class MainLoginPage extends StatelessWidget {
  const MainLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Donate();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
