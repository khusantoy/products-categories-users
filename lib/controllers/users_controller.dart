import 'package:products_categories_users/models/user.dart';
import 'package:products_categories_users/services/users_http_service.dart';

class UsersController {
  final usersHttpService = UsersHttpService();
  Future<List<User>> getUsers() async {
    List<User> users = await usersHttpService.getUsers();
    return users;
  }
}