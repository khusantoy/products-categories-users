import 'package:flutter/material.dart';
import 'package:products_categories_users/views/screens/categories_screen.dart';
import 'package:products_categories_users/views/screens/products_screen.dart';
import 'package:products_categories_users/views/screens/users_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: tabController.index == 0
            ? const Text("Categories")
            : tabController.index == 1
                ? const Text("Products")
                : const Text("Users"),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Colors.black,
            labelColor: Colors.white,
            controller: tabController,
            tabs: const [
              Tab(
                text: "Categories",
                icon: Icon(Icons.category),
              ),
              Tab(
                text: "Products",
                icon: Icon(Icons.shopping_cart),
              ),
              Tab(
                text: "Users",
                icon: Icon(Icons.group),
              )
            ]),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                CategoriesScreen(),
                ProductsScreen(),
                UsersScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
