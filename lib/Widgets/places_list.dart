import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/screens/place_details_screen.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.placesList});

  final List<Place> placesList;

  @override
  Widget build(BuildContext context) {
    if (placesList.isEmpty) {
      return Center(
        child: Text(
          'No places add to your favourites.',
          style: TextTheme.of(
            context,
          ).bodyLarge!.copyWith(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return ListView.builder(
      itemCount: placesList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: FileImage(placesList[index].image),
            ),
            title: Text(
              placesList[index].name,
              style: TextTheme.of(
                context,
              ).bodyMedium!.copyWith(fontSize: 20, color: Colors.white),
            ),
            subtitle: Text(
              placesList[index].location.address,
              style: TextTheme.of(
                context,
              ).bodySmall!.copyWith(fontSize: 12, color: Colors.white),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      PlaceDetailsScreen(place: placesList[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
