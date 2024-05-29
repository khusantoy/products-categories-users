import 'package:flutter/material.dart';
import 'package:products_categories_users/controllers/categories_controller.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final categoriesController = CategoriesController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: categoriesController.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber,),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text("No Available Categories"),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final categories = snapshot.data;

          return categories == null || categories.isEmpty
              ? const Center(
                  child: Text("No Available Categories :("),
                )
              : Container(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 9,
                    ),
                    itemBuilder: (context, index) {
                      final category = categories[index];
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
                                category.image,
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
                                  Text(category.name),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Created at:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(category.creationAt),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Updated at:",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(category.updatedAt),
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
