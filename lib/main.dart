import 'package:pt_veflat/providers/cart.dart';
import 'package:pt_veflat/providers/categorias_providers.dart';
import 'package:pt_veflat/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/products_overview.dart';
import './screens/products_detail.dart';
import './providers/products_providers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),

        ChangeNotifierProvider(
          create: (context) => CategoriasProviders(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => Categoria(),
        // ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'prueba_VEFLAT',
          theme: ThemeData(
            fontFamily: 'Inter',
          ),
          home: const ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName: (context) =>
                const ProductDetailScreen(),
            CartScreen.routeName: (context) => const CartScreen(),
          }),
    );
  }
}
