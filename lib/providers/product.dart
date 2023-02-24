import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String species;
  final String nombre;
  final String gender;
  final String type;
  final double precio;
  final String imagenUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.species,
    required this.nombre,
    required this.gender,
    required this.type,
    required this.precio,
    required this.imagenUrl,
    this.isFavorite = false,
  });
  void favoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
