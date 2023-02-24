import 'package:pt_veflat/widgets/categorias_item_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/categorias_providers.dart';

class CategoriasGrid extends StatefulWidget {
  const CategoriasGrid({super.key});

  @override
  State<CategoriasGrid> createState() => _CategoriasGridState();
}

class _CategoriasGridState extends State<CategoriasGrid> {
  String categoria = 'All';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<CategoriasProviders>(context);
    final products = productsData.items;

    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: GestureDetector(
            onTap: () {
              setState(() {
                categoria = products[i].nombre;
              });
            },
            child: CategoriaItemGrid(
                categoria == products[i].nombre ? true : false)),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 10,
        mainAxisExtent: 75,
      ),
    );
  }
}
