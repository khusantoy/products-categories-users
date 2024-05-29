import 'package:flutter/material.dart';
import 'package:products_categories_users/controllers/products_controller.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final productsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: productsController.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber,),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("No Available Products"),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final products = snapshot.data;

          return products == null || products.isEmpty
              ? const Center(
                  child: Text("No Available Products :("),
                )
              : Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: products.length,

                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Card(
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 200,
                              child: Image.network(
                                product.images[0],
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return const Center(
                                    child: Icon(
                                      Icons.error,
                                      color: Colors.red,
                                    ),
                                  );
                                },
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Name:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(product.title),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Price:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(product.price.toString()),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Description:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(product.description),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Created at:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(product.creationAt),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Updated at:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(product.updatedAt),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
        });
  }
}
