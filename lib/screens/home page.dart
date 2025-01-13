// ignore_for_file: library_private_types_in_public_api, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:sara/main.dart';
import 'package:sara/screens/Categories%20page.dart';
import 'package:sara/screens/Favourite%20page.dart';
import 'package:sara/services/logout_service.dart';
import 'package:sara/widgets/Custom_Drawer.dart';
import 'package:sara/widgets/Home_Page%20widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePageWidget(),
    const OrdersPage(),
    const CartPage(),
    const FavoritesPage(),
    const CategoriesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text('new trend '),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              print(sharedPreferences!.getString("token"));
              await LogoutService().logout();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              sharedPreferences!.clear();
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Category',
          ),
        ],
        backgroundColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.cyan,
      ),
    );
  }
}
