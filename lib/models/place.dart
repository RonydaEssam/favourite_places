import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class Place {
  Place({required this.name, required this.image}) : id = uuid.v4();

  String id;
  String name;
  File image;
}
