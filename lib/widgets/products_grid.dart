import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_providers.dart';
import './products_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProviders>(context);
    final products = productsData.items;

    return Expanded(
      flex: 1,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 4),
          mainAxisSpacing: 15,
          crossAxisSpacing: 10,
          mainAxisExtent: 180,
        ),
      ),
    );
  }
}
