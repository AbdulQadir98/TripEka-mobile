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
            SizedBox(height: 20.0),
            Text(
              'Update your Order.',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            TextFormField(initialValue: _name),
            SizedBox(height: 20.0),
            DropdownButtonFormField(
              value: _currentSugars,
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar sugars'),
                );
              }).toList(),
              onChanged: (String? val) => setState(() => _currentSugars = val!),
            ),
            SizedBox(height: 20.0),
            Slider(
              value: (_currentStrength).toDouble(),
              activeColor: Colors.brown[_currentStrength],
              inactiveColor: Colors.brown[_currentStrength],
              min: 100.0,
              max: 900.0,
              divisions: 8,
              onChanged: (val) =>
                  setState(() => _currentStrength = val.round()),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
                child: Text(
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
