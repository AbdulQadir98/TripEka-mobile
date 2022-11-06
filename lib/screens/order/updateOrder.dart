import 'package:app/services/database.dart';
import 'package:flutter/material.dart';

class UpdateOrders extends StatefulWidget {
  final String docid;
  const UpdateOrders(this.docid, {super.key});

  @override
  State<UpdateOrders> createState() => _UpdateOrdersState();
}

class _UpdateOrdersState extends State<UpdateOrders> {
  final List<String> names = ['Rice', 'Kottu', 'EggHoppers', 'Roti'];
  final List<String> spice = ['hot', 'normal', 'low'];

  // form values
  String _currentName = "Rice";
  String _currentSpice = "normal";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10.0),
            const Text(
              'CHANGE ORDER',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 28.0),
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
              'Choose Spice Level',
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
                  // if (_formKey.currentState!.validate()) {
                  var response = await Database.updateOrder(
                      name: _currentName,
                      spice: _currentSpice,
                      docId: widget.docid);
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
                  // }
                }),
          ],
        ),
      ),
    );
  }
}
