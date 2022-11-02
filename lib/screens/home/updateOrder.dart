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
  String _currentSugars = "20";
  int _currentStrength = 500;

  // hardcode values
  String _name = "Abdul";
  String _sugars = "10";
  int _strength = 300;

  // Example normal dropdown
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

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
          // DropdownButtonFormField(
          //   value: _currentSugars,
          //   items: sugars.map((sugar) {
          //     return DropdownMenuItem(
          //       value: sugar,
          //       child: Text('$sugar sugars'),
          //     );
          //   }).toList(),
          //   onChanged: (val) => setState(() => _currentSugars = val),
          // ),
          DropdownButton(
            // Initial Value
            value: dropdownvalue,
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),
            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          SizedBox(height: 10.0),
          Slider(
            value: (_currentStrength).toDouble(),
            activeColor: Colors.brown[_currentStrength],
            inactiveColor: Colors.brown[_currentStrength],
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
