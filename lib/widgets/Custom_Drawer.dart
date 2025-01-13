// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sara/screens/login_page.dart';
import 'package:sara/screens/profile_page.dart';
import 'package:sara/screens/my_card.dart';
import 'package:sara/screens/my_order.dart';
import 'package:sara/services/logout_service.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  RxBool isLoading = false.obs;

  void loadingIndicatorFalse() {
    isLoading.value = false;
    setState(() {});
  }

  void loadingIndicatorTrue() {
    isLoading.value = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading.value,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Full Name'),
              accountEmail: Text('email@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    AssetImage('images/Screenshot 2024-11-17 230023.png'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('My Orders'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyOrder()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text(' my Cart'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyCard()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('my Favorites'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ElevatedButton(
              onPressed: () async {
                loadingIndicatorTrue();

                try {
                  await LogoutService().logout();
                  print('Success');
                  loadingIndicatorFalse();
                  Get.snackbar(
                    'Hi',
                    'User Successfully logged out',
                  );
                  Get.off(() => const Loginpage());
                } catch (e) {
                  print(e.toString());
                  Get.snackbar(
                    'Sorry',
                    e.toString(),
                    colorText: Colors.white,
                    backgroundColor: Colors.red,
                  );
                }
                loadingIndicatorFalse();
              },
              style: ElevatedButton.styleFrom(),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
