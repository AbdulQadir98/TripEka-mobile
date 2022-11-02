import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/screens/home/orders.dart';
import '../../services/database.dart';
import '../../models/user.dart';
import 'orders.dart';
import 'updateOrder.dart';

// Home has to be a sateless widget
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _showCreatePanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Orders();
        });
  }

  void _showUpdatePanel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return UpdateOrders();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          elevation: 0.0,
          title: Text('Welcome Bosa'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text('Create Order'),
                onPressed: () => _showCreatePanel(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  print("HERE");
                },
              ),
            ),
          ],
        ),
        body: Container(
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                // if the firestore database has data
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 20.0),
                        const CircularProgressIndicator(),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                          },
                          child: const Text('SignOut'),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/colombo.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (ctx, index) => Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Card(
                          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                          child: Column(
                            children: [
                              SizedBox(height: 15.0),
                              ListTile(
                                leading: CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.brown[
                                      snapshot.data!.docs[index]['strength']],
                                ),
                                title:
                                    Text(snapshot.data!.docs[index]['email']),
                                subtitle: Text(
                                    'Takes ${snapshot.data!.docs[index]['email']} sugar(s)'),
                                // onTap: () => _showUpdatePanel(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                    child: const Text('UPDATE'),
                                    onPressed: () => _showUpdatePanel(),
                                  ),
                                  const SizedBox(width: 8),
                                  TextButton(
                                    child: const Text('DELETE'),
                                    onPressed: () {/* ... */},
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                              SizedBox(height: 5.0),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  // ElevatedButton(
                  //   onPressed: () {
                  //     print("user details");
                  //   },
                  //   child: const Text('Test'),
                  // );
                }
              }),
        ));
  }
}
