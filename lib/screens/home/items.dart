import 'package:app/services/database.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            Text(
              "ADD TO ORDER LIST",
              style:
                  DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/Kottu.jpg",
                            height: 150,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 2.0),
                          TextButton(
                            child: const Text('ORDER'),
                            onPressed: () async {
                              var response = await Database.addCoffee(
                                  name: "Kottu", spice: "normal");
                              if (response.code != 200) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                        content: Text(
                                            "Order has been placed Successfully"),
                                      );
                                    });
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content:
                                            Text(response.message.toString()),
                                      );
                                    });
                              }
                            },
                          ),
                          const SizedBox(height: 2.0),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/Rice.jpg",
                            height: 150,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 2.0),
                          TextButton(
                            child: const Text('ORDER'),
                            onPressed: () async {
                              var response = await Database.addCoffee(
                                  name: "Rice", spice: "normal");
                              if (response.code != 200) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                        content: Text(
                                            "Order has been placed Successfully"),
                                      );
                                    });
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content:
                                            Text(response.message.toString()),
                                      );
                                    });
                              }
                            },
                          ),
                          const SizedBox(height: 2.0),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/Roti.jpg",
                            height: 150,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 2.0),
                          TextButton(
                            child: const Text('ORDER'),
                            onPressed: () async {
                              var response = await Database.addCoffee(
                                  name: "Roti", spice: "normal");
                              if (response.code != 200) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                        content: Text(
                                            "Order has been placed Successfully"),
                                      );
                                    });
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content:
                                            Text(response.message.toString()),
                                      );
                                    });
                              }
                            },
                          ),
                          const SizedBox(height: 2.0),
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/EggHoppers.jpg",
                            height: 150,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 2.0),
                          TextButton(
                            child: const Text('ORDER'),
                            onPressed: () async {
                              var response = await Database.addCoffee(
                                  name: "EggHoppers", spice: "normal");
                              if (response.code != 200) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const AlertDialog(
                                        content: Text(
                                            "Order has been placed Successfully"),
                                      );
                                    });
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content:
                                            Text(response.message.toString()),
                                      );
                                    });
                              }
                            },
                          ),
                          const SizedBox(height: 2.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
