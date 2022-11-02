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
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;

  // hardcode values
  String _name = "Abdul";
  String _sugars = "10";
  int _strength = 300;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Text(
            'Update your brew settings.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(initialValue: _name),
          SizedBox(height: 10.0),
          DropdownButtonFormField(
            value: _currentSugars ?? _sugars,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugars'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentSugars = "4"),
          ),
          SizedBox(height: 10.0),
          Slider(
            value: (_currentStrength ?? _strength).toDouble(),
            activeColor: Colors.brown[_currentStrength ?? _strength],
            inactiveColor: Colors.brown[_currentStrength ?? _strength],
            min: 100.0,
            max: 900.0,
            divisions: 8,
            onChanged: (val) => setState(() => _currentStrength = val.round()),
          ),
          ElevatedButton(
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {}),
        ],
      ),
    );
  }
}
