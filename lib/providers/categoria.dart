import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Categoria with ChangeNotifier {
  final String id;
  final String nombre;

  Categoria({
    required this.id,
    required this.nombre,
  });
}
