import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../services/database.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final _name = TextEditingController();
  final _suagrs = TextEditingController();
  final _strength = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final List<int> strengths = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  // form values
  String _currentName = "";
  String _currentSugars = "";
  int _currentStrength = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _name,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "This field is required";
                        }
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _suagrs,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "This field is required";
                        }
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'sugars',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _strength,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "This field is required";
                        }
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'strength',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(height: 20.0),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      child: Text(
                        'Place New Order',
                        style: TextStyle(color: Colors.white),
                      ),
                      // onPressed: () async {
                      //   print("Order Placed");
                      // }),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var response = await Database.addCoffee(
                              name: _name.text,
                              sugars: _suagrs.text,
                              // TODO : int value
                              strength: _strength.hashCode);
                          if (response.code != 200) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.message.toString()),
                                  );
                                });
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(response.message.toString()),
                                  );
                                });
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
