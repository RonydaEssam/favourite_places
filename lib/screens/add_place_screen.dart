import 'package:favourite_places/models/place.dart';
import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() {
    return AddPlaceScreenState();
  }
}

class AddPlaceScreenState extends State<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<Place> addedPlaces = [];
  var _enteredPlace = '';

  void _addPlace() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      addedPlaces.add(Place(name: _enteredPlace));

      Navigator.of(context).pop();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(
        SnackBar(content: Text('Added a new place to your list.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new place')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Place name'),
                maxLength: 50,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length > 50) {
                    return 'Please add a valid name.';
                  }
                  return null;
                },
                onSaved: (place) {
                  _enteredPlace = place!;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: _addPlace,
                    icon: Icon(Icons.add),
                    label: Text('Add place'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
