import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String nombre;
  final String imagenUrl;
  final int cantidad;
  final double precio;
  final String color;

  final String talla;

  CartItem({
    required this.id,
    required this.cantidad,
    required this.precio,
    required this.nombre,
    required this.imagenUrl,
    required this.talla,
    required this.color,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalMonto {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.precio * value.cantidad;
    });
    return total;
  }

  void addItem(
    String productId,
    double precio,
    String nombre,
    String imagenUrl,
    String color,
    String talla,
  ) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          cantidad: value.cantidad + 1,
          precio: value.precio,
          nombre: value.nombre,
          imagenUrl: value.imagenUrl,
          talla: talla,
          color: color,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          cantidad: 1,
          precio: precio,
          nombre: nombre,
          imagenUrl: imagenUrl,
          talla: talla,
          color: color,
        ),
      );
    }
    notifyListeners();
  }

  void reomveItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.cantidad > 1) {
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          cantidad: value.cantidad - 1,
          precio: value.precio,
          nombre: value.nombre,
          imagenUrl: value.imagenUrl,
          talla: value.talla,
          color: value.color,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }
}
