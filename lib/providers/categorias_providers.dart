import 'package:flutter/material.dart';
import './categoria.dart';

class CategoriasProviders with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Categoria> _items = [
    Categoria(
      id: '0',
      nombre: 'All',
    ),
    Categoria(
      id: '1',
      nombre: 'Winter',
    ),
    Categoria(
      id: '2',
      nombre: 'Men',
    ),
    Categoria(
      id: '3',
      nombre: 'Women',
    ),
    Categoria(
      id: '4',
      nombre: 'Sport',
    ),
  ];

  List<Categoria> get items {
    return [..._items];
  }
}
