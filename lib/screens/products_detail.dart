import 'package:pt_veflat/providers/cart.dart';
import 'package:pt_veflat/providers/products_providers.dart';
import 'package:pt_veflat/screens/cart_screen.dart';
import 'package:pt_veflat/widgets/badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = '/product-detail';

  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String color = 'Grey';
  String talla = 'S';
  bool description = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct = Provider.of<ProductsProviders>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
            ),
          ),
        ),
        actions: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: IconButton(
              color: const Color.fromRGBO(30, 30, 30, 1.0),
              icon: const Icon(
                Icons.favorite_border,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Consumer<Cart>(
            builder: (_, cartData, child) => BadgeWidget(
              value: cartData.itemCount.toString(),
              child: child as Widget,
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: IconButton(
                color: const Color.fromRGBO(30, 30, 30, 1.0),
                icon: const Icon(
                  Icons.shopping_basket_outlined,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {
          cart.addItem(
            loadedProduct.id,
            loadedProduct.precio,
            loadedProduct.nombre,
            loadedProduct.imagenUrl,
            talla,
            color,
          );
        },
        backgroundColor: Colors.black,
        label: Container(
          width: 250,
          height: 40,
          alignment: Alignment.center,
          child: const Text(
            'Add to Cart',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imagenUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                loadedProduct.nombre,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '€ ${loadedProduct.precio}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                      RichText(
                        text: const TextSpan(
                          text: '4.8',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '(2.6k + review)',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: RichText(
                text: TextSpan(
                  text: 'Size: ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: talla,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 8.0, bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        talla = 'S';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: talla == 'S'
                              ? const Color.fromARGB(255, 255, 138, 42)
                              : const Color.fromARGB(255, 219, 219, 219),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: talla == 'S'
                          ? const Color.fromARGB(255, 255, 153, 70)
                          : Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        child: Text(
                          'S',
                          style: TextStyle(
                            color: talla == 'S' ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        talla = 'M';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: talla == 'M'
                              ? const Color.fromARGB(255, 255, 138, 42)
                              : const Color.fromARGB(255, 219, 219, 219),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: talla == 'M'
                          ? const Color.fromARGB(255, 255, 153, 70)
                          : Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        child: Text(
                          'M',
                          style: TextStyle(
                            color: talla == 'M' ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        talla = 'L';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: talla == 'L'
                              ? const Color.fromARGB(255, 255, 138, 42)
                              : const Color.fromARGB(255, 219, 219, 219),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: talla == 'L'
                          ? const Color.fromARGB(255, 255, 153, 70)
                          : Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        child: Text(
                          'L',
                          style: TextStyle(
                            color: talla == 'L' ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        talla = 'XL';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: talla == 'XL'
                              ? const Color.fromARGB(255, 255, 138, 42)
                              : const Color.fromARGB(255, 219, 219, 219),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: talla == 'XL'
                          ? const Color.fromARGB(255, 255, 153, 70)
                          : Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        child: Text(
                          'XL',
                          style: TextStyle(
                            color: talla == 'XL' ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        talla = 'XXL';
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: talla == 'XXL'
                              ? const Color.fromARGB(255, 255, 138, 42)
                              : const Color.fromARGB(255, 219, 219, 219),
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: talla == 'XXL'
                          ? const Color.fromARGB(255, 255, 153, 70)
                          : Colors.white,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        child: Text(
                          'XXL',
                          style: TextStyle(
                            color: talla == 'XXL' ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: RichText(
                text: TextSpan(
                  text: 'Select Color: ',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: color,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 8.0, bottom: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color = 'Grey';
                      });
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.grey,
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: color == 'Grey'
                              ? Colors.white
                              : Colors.transparent,
                          child: Container(
                            alignment: Alignment.center,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color = 'Black';
                      });
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.black,
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: color == 'Black'
                              ? Colors.white
                              : Colors.transparent,
                          child: Container(
                            alignment: Alignment.center,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color = 'Blue';
                      });
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.blue,
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: color == 'Blue'
                              ? Colors.white
                              : Colors.transparent,
                          child: Container(
                            alignment: Alignment.center,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color = 'Rose';
                      });
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color.fromARGB(216, 255, 216, 231),
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: color == 'Rose'
                              ? Colors.white
                              : Colors.transparent,
                          child: Container(
                            alignment: Alignment.center,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color = 'Purple';
                      });
                    },
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Colors.deepPurple[300],
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: color == 'Purple'
                              ? Colors.white
                              : Colors.transparent,
                          child: Container(
                            alignment: Alignment.center,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    description = !description;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Description'),
                    Icon(description == true
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded)
                  ],
                ),
              ),
            ),
            description == true
                ? const Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'),
                  )
                : Container(),
            const SizedBox(
              height: 75,
            ),
          ],
        ),
      ),
    );
  }
}
