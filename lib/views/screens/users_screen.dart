import 'package:flutter/material.dart';
import 'package:products_categories_users/controllers/users_controller.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  final usersController = UsersController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: usersController.getUsers(),
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

          final users = snapshot.data;

          return users == null || users.isEmpty
              ? const Center(
            child: Text("No Available Products :("),
          )
              : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    trailing: Text(user.role),
                  );
                },
              );
        });
  }
}
