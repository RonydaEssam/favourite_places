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
  final addedPlaces = [];
  late Place place;

  void _addPlace() {
    Navigator.of(context).pop();
    /*
    if (_formKey.currentState!.validate()) {
      addedPlaces.add(place);

      

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Saving data')));
    }
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new place:')),
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
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _addPlace,
                icon: Icon(Icons.add),
                label: Text('Add place'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
