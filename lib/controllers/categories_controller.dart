import 'package:products_categories_users/models/category.dart';
import 'package:products_categories_users/services/categories_http_service.dart';

class CategoriesController {
  final categoriesHttpService = CategoriesHttpService();
  Future<List<Category>> getCategories() async {
    List<Category> categories = await categoriesHttpService.getCategories();
    return categories;
  }
}