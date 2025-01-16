// ignore_for_file: library_private_types_in_public_api, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:sara/generated/l10n.dart';
import 'package:sara/screens/cart_page.dart';
import 'package:sara/screens/home_content_page.dart';
import 'package:sara/screens/my_order.dart';
import 'package:sara/screens/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomeContentPage(),
    const ShowOrdersPage(),
    const CartPage(),
    const ProfilePage(),
    // const FavoritesPage(),
    // const CategoriesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: S.of(context).Home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_bag),
            label: S.of(context).Orders,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: S.of(context).Cart,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_4),
            label: S.of(context).Profile,
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.apps),
          //   label: 'Category',
          // ),
        ],
        backgroundColor: Colors.black,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.cyan,
      ),
    );
  }
}
