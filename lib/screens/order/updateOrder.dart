import 'package:flutter/material.dart';

class UpdateOrders extends StatefulWidget {
  const UpdateOrders({super.key});

  @override
  State<UpdateOrders> createState() => _UpdateOrdersState();
}

class _UpdateOrdersState extends State<UpdateOrders> {
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final List<int> strengths = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  // form values
  String _currentName = "Vili";
  String _currentSugars = "2";
  int _currentStrength = 500;

  // hardcode values
  String _name = "Abdul";
  String _sugars = "10";
  int _strength = 300;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10.0),
            const Text(
              'Update your Order.',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            DropdownButtonFormField(
              value: _currentSugars,
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text(sugar),
                );
              }).toList(),
              onChanged: (String? val) => setState(() => _currentSugars = val!),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Spice level.',
              style: TextStyle(fontSize: 18.0),
            ),
            Slider(
              value: (_currentStrength).toDouble(),
              activeColor: Colors.red[_currentStrength],
              inactiveColor: Colors.red[_currentStrength],
              min: 100.0,
              max: 900.0,
              divisions: 8,
              onChanged: (val) =>
                  setState(() => _currentStrength = val.round()),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {}),
          ],
        ),
      ),
    );
  }
}
