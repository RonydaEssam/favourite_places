import 'package:favourite_places/Providers/user_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return AddPlaceScreenState();
  }
}

class AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  var _enteredPlace = '';

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _addPlace() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      _enteredPlace = _titleController.text;
      ref.read(userPlacesProvider.notifier).addPlace(_enteredPlace);

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                maxLength: 50,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length > 50) {
                    return 'Please add a valid name.';
                  }
                  return null;
                },
                controller: _titleController,
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
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: _addPlace,
                    icon: const Icon(Icons.add),
                    label: const Text('Add place'),
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
