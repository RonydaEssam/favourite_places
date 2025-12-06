import 'package:favourite_places/models/place.dart';
import 'package:flutter_riverpod/legacy.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String name) {
    final newPlace = Place(name: name);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
      (ref) => UserPlacesNotifier(),
    );
