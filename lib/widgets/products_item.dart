import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/products_detail.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    const borderRadius = BorderRadius.all(Radius.circular(20));

    return InkWell(
      borderRadius: borderRadius,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ProductDetailScreen.routeName,
                  arguments: product.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  children: [
                    Image.network(
                      product.imagenUrl,
                      width: 180,
                      height: 250,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      right: 0,
                      child: Consumer<Product>(
                        builder: (ctx, product, child) => IconButton(
                          icon: Icon(
                            product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 25,
                          ),
                          color:
                              product.isFavorite ? Colors.black : Colors.black,
                          onPressed: () {
                            product.favoriteStatus();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            product.nombre,
            maxLines: 1,
            style: const TextStyle(
              color: Color.fromRGBO(144, 144, 144, 1.0),
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
          ),
          Text(
            '€${product.precio.toStringAsFixed(2)}',
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121)),
          ),
        ],
      ),
    );
  }
}
