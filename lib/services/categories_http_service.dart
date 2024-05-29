import 'dart:convert';

import 'package:products_categories_users/models/category.dart';
import 'package:http/http.dart' as http;

class CategoriesHttpService {
  Future<List<Category>> getCategories() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/categories");
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<Category> loadedCategories = [];

    if (data != null) {
      for (var element in data) {
        loadedCategories.add(Category.fromJson(element));
      }
    }
    return loadedCategories;
  }
}