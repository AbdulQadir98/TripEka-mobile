import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../services/database.dart';
import '../../models/user.dart';

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
          title: Text('Welcome Bosa'),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('users').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              // if the firestore database has data
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  // itemBuilder: (ctx, index) => Container(
                  //   child: Text("snapshot.data!.docs[index]['email']"),
                  // ),
                  itemBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors
                              .brown[snapshot.data!.docs[index]['strength']],
                        ),
                        title: Text(snapshot.data!.docs[index]['email']),
                        subtitle: Text(
                            'Takes ${snapshot.data!.docs[index]['email']} sugar(s)'),
                      ),
                    ),
                  ),
                );
                // return Container(
                //   padding:
                //       EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                //   child: Center(
                //     child: Column(
                //       children: [
                //         Text('No data in database'),
                //         SizedBox(height: 20.0),
                //         ElevatedButton(
                //           onPressed: () {
                //             // FirebaseAuth.instance.signOut();
                //             // print(snapshot.data!.docs[0].data());
                //             print(snapshot.data!.docs.map((e) {
                //               e["name"];
                //             }));
                //           },
                //           child: Text('SignOut'),
                //         )
                //       ],
                //     ),
                //   ),
                // );
              }
            }));
  }
}
