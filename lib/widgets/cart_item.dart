import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String nombre;
  final String imagenUrl;
  final double precio;
  final int cantidad;
  final String talla;
  final String color;

  const CartItem(this.id, this.productId, this.nombre, this.imagenUrl,
      this.cantidad, this.precio, this.color, this.talla,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Padding(
      padding: const EdgeInsets.only(
        top: 2.0,
        bottom: 2.0,
        left: 8.0,
        right: 8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imagenUrl,
              height: 180,
              width: 140,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: SizedBox(
              height: 200,
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          bottom: 8.0,
                        ),
                        child: Text(
                          nombre,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          bottom: 8.0,
                          top: 8.0,
                        ),
                        child: Text(
                          'Size $talla',
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          bottom: 8.0,
                          top: 8.0,
                        ),
                        child: Text(
                          '€${(precio * cantidad)}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              cart.removeSingleItem(productId);
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              color: Colors.white,
                              child: Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 25,
                                child: const Icon(
                                  Icons.remove,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              right: 8.0,
                            ),
                            child: Text(
                              '$cantidad',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              cart.addItem(productId, precio, nombre, imagenUrl,
                                  talla, color);
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              color: Colors.white,
                              child: Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 25,
                                child: const Icon(
                                  Icons.add,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 224, 224, 224),
                          ),
                          overlayColor: MaterialStateProperty.all(Colors.black),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                        ),
                        color: Colors.grey,
                        icon: const Icon(
                          Icons.close,
                        ),
                        onPressed: () {
                          cart.reomveItem(
                            productId,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
