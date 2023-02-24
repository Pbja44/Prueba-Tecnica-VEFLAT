import 'package:pt_veflat/providers/cart.dart';
import 'package:pt_veflat/providers/products_providers.dart';
import 'package:pt_veflat/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../widgets/categorias_grid.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<ProductsProviders>(context).fetchAndSetProducts().then((_) {
        _isLoading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 50,
        shadowColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        leading: const Icon(
          size: 40,
          Icons.drag_handle,
          color: Color.fromRGBO(30, 30, 30, 1.0),
        ),
        actions: <Widget>[
          const Icon(
            Icons.search,
            size: 30,
            color: Color.fromRGBO(30, 30, 30, 1.0),
          ),
          Consumer<Cart>(
            builder: (_, cartData, child) => BadgeWidget(
              value: cartData.itemCount.toString(),
              child: child as Widget,
            ),
            child: IconButton(
              color: const Color.fromRGBO(30, 30, 30, 1.0),
              icon: const Icon(
                Icons.shopping_basket_outlined,
              ),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 10.0,
              bottom: 10.0,
            ),
            child: Text(
              'Find Your Clothes',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10.0,
              left: 10.0,
              right: 10.0,
            ),
            width: double.infinity,
            height: 180,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: const Color.fromARGB(216, 255, 216, 231),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Dec 16 - Dec 31\n',
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.normal,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '25% Off',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 35),
                              ),
                              TextSpan(
                                text: '\nSuper Discount',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          child: const Text('Grab Now'),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 70,
            child: CategoriasGrid(),
          ),
          _isLoading
              ? Center(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 50,
                      left: 30,
                      right: 30,
                      bottom: 30,
                    ),
                    child: const LinearProgressIndicator(
                      color: Color.fromARGB(216, 255, 216, 231),
                      backgroundColor: Color.fromARGB(215, 136, 135, 135),
                    ),
                  ),
                )
              : const ProductsGrid(),
        ],
      ),
    );
  }
}
