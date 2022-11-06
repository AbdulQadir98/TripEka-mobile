import 'package:app/screens/home/items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/screens/order/orders.dart';
import '../../services/database.dart';
import '../../models/user.dart';
import '../order/orders.dart';
import '../order/updateOrder.dart';

// Home has to be a sateless widget
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          elevation: 0.0,
          title: const Text('Welcome Bosa'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                // icon: Icon(Icons.add),
                child: const Text('Orders'),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Orders()),
                  )
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.person),
                label: const Text('logout'),
                onPressed: () async {
                  print(FirebaseAuth.instance.currentUser!.uid);
                },
              ),
            ),
          ],
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('coffee').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              // if the firestore database has data
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(height: 100.0),
                      const CircularProgressIndicator(),
                    ],
                  ),
                );
              } else {
                return const Items();
              }
            }));
  }
}
