import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/screens/add_place_screen.dart';
import 'package:favourite_places/screens/place_details_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Place> placesList = [Place(name: 'Home'), Place(name: 'Work')];

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favourite Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AddPlaceScreen()));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: placesList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              for (final place in placesList)
                ListTile(
                  title: Text(
                    place.name,
                    style: TextTheme.of(
                      context,
                    ).bodyMedium!.copyWith(fontSize: 20, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            PlaceDetailsScreen(title: place.name),
                      ),
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
