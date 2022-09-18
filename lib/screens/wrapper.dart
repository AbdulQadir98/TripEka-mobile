import 'package:app/screens/authenticate/authenticate.dart';
import 'package:app/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // return either the Home or Authenticate widget
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Home();
              } else {
                return Authenticate();
              }
            })));
  }
}
