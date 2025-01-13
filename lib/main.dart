// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sara/middleware/auth_middleware.dart';
import 'package:sara/screens/home%20page.dart';
import 'package:sara/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

void main() async {
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool ispassworsvisible = false;

  Icon passwordIcon = const Icon(Icons.visibility_off);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const Loginpage(),
          middlewares: [AuthMiddleware()],
        ),
        GetPage(
          name: '/home',
          page: () => const HomePage(),
        ),
      ],
      initialRoute: '/',
    );
  }
}
