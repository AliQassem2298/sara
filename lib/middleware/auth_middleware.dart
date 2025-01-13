import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sara/main.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences!.getString("token") != null) {
      return const RouteSettings(name: '/home');
    }
    return null;
  }
}
