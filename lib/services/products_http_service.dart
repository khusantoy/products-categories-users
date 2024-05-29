import 'dart:convert';

import 'package:products_categories_users/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsHttpService {
  Future<List<Product>> getProducts() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/products");
    final response =  await http.get(url);
    final data = jsonDecode(response.body);
    List<Product> loadedProducts = [];

    if (data != null) {
      for (var element in data) {
        loadedProducts.add(Product.fromJson(element));
      }
    }

    return loadedProducts;
  }
}