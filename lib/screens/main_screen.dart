import 'package:favourite_places/Providers/user_places.dart';
import 'package:favourite_places/Widgets/places_list.dart';
import 'package:favourite_places/screens/add_place_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(userPlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: _placesFuture,
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : PlacesList(placesList: userPlaces),
      ),
    );
  }
}
