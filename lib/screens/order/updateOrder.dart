import 'package:flutter/material.dart';

class UpdateOrders extends StatefulWidget {
  const UpdateOrders({super.key});

  @override
  State<UpdateOrders> createState() => _UpdateOrdersState();
}

class _UpdateOrdersState extends State<UpdateOrders> {
  final List<String> names = ['Rice', 'Kottu', 'StringHoppers', 'Roti'];
  final List<String> spice = ['hot', 'normal', 'low'];

  // form values
  String _currentName = "Kottu";
  String _currentSpice = "normal";

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10.0),
            const Text(
              'CHANGE ORDER',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            DropdownButtonFormField(
              value: _currentName,
              items: names.map((name) {
                return DropdownMenuItem(
                  value: name,
                  child: Text(name),
                );
              }).toList(),
              onChanged: (String? val) => setState(() => _currentName = val!),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Spice level.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20.0),
            DropdownButtonFormField(
              value: _currentSpice,
              items: spice.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? val) => setState(() => _currentSpice = val!),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
                child: const Text(
                  'Done',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  print("update order");
                }),
          ],
        ),
      ),
    );
  }
}
