import 'package:products_categories_users/models/product.dart';
import 'package:products_categories_users/services/products_http_service.dart';

class ProductsController {
  final productsHttpService =  ProductsHttpService();
  Future<List<Product>> getProducts() async {
    List<Product> products = await productsHttpService.getProducts();
    return products;
  }
 }