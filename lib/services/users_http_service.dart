import 'dart:convert';

import 'package:products_categories_users/models/user.dart';
import 'package:http/http.dart' as http;
class UsersHttpService {
  Future<List<User>> getUsers() async{
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/users");
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<User> loadedUsers = [];

    if(data != null) {
      for (var element in data) {
        loadedUsers.add(User.fromJson(element));
      }
    }

    return loadedUsers;
  }
}