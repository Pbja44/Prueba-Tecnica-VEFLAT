import 'dart:convert';
import 'package:flutter/material.dart';
import './product.dart';
import 'package:http/http.dart' as http;

class ProductsProviders with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    var url = Uri.https(
      'rickandmortyapi.com',
      '/api/character',
    );
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List data = extractedData['results'];
      // ignore: unnecessary_null_comparison
      if (data == null) {
        return;
      }

      final List<Product> loadedProducts = [];
      for (var element in data) {
        loadedProducts.add(
          Product(
            id: element['id'].toString(),
            species: element['species'],
            type: element['type'].toString(),
            nombre: element['name'],
            gender: element['gender'],
            precio: 55,
            imagenUrl: element['image'],
          ),
        );
      }

      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
