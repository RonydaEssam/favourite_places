import 'package:favourite_places/Providers/user_places.dart';
import 'package:favourite_places/Widgets/places_list.dart';
import 'package:favourite_places/screens/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favourite Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(
                MaterialPageRoute(builder: (context) => const AddPlaceScreen()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: PlacesList(placesList: userPlaces),
    );
  }
}
