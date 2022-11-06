import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  void _showUpdatePanel() {
    // showModalBottomSheet(
    //     context: context,
    //     builder: (context) {
    //       return UpdateOrders();
    //     });
  }

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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/colombo.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (ctx, index) => Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Card(
                        margin: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            // SizedBox(height: 15.0),
                            ListTile(
                              leading: CircleAvatar(
                                radius: 25.0,
                                // backgroundColor: Colors.brown[
                                //     snapshot.data!.docs[index]['strength']],
                                backgroundImage: AssetImage(
                                    "images/${snapshot.data!.docs[index]['name']}.jpg"),
                              ),
                              title: Text(snapshot.data!.docs[index]['name']),
                              subtitle: Text(
                                  'spice level : ${snapshot.data!.docs[index]['spice']}'),
                              trailing: Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.more_vert),
                                    onPressed: () => _showUpdatePanel(),
                                  )
                                ],
                              ),
                              //onTap: () => _showUpdatePanel(),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: <Widget>[
                            //     TextButton(
                            //       child: const Text('UPDATE'),
                            //       onPressed: () => _showUpdatePanel(),
                            //     ),
                            //     const SizedBox(width: 8),
                            //     TextButton(
                            //       child: const Text('DELETE'),
                            //       onPressed: () async {
                            //         // var response =
                            //         //     await Database.deleteCoffee(
                            //         //         docId: e.id);
                            //         // if (response.code != 200) {
                            //         //   showDialog(
                            //         //       context: context,
                            //         //       builder: (context) {
                            //         //         return AlertDialog(
                            //         //           content: Text(response.message
                            //         //               .toString()),
                            //         //         );
                            //         //       });
                            //         // }
                            //       },
                            //     ),
                            //     const SizedBox(width: 8),
                            //   ],
                            // ),
                            // SizedBox(height: 5.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            }));
  }
}
