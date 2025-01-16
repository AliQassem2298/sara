// ignore_for_file: avoid_print, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sara/generated/l10n.dart';
import 'package:sara/helper/api.dart';
import 'package:sara/main.dart';
import 'package:sara/screens/cart_page.dart';
import 'package:sara/screens/login_page.dart';
import 'package:sara/screens/profile_page.dart';
import 'package:sara/screens/my_order.dart';
import 'package:sara/services/logout_service.dart';
import 'package:sara/services/profile_service.dart'; // تأكد من استيراد السيرفس
import 'package:sara/models/profile_model.dart'; // تأكد من استيراد الموديل

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  RxBool isLoading = false.obs;
  late Future<ProfileModel> _profileFuture;
  final ProfileService _profileService = ProfileService();

  @override
  void initState() {
    super.initState();
    _profileFuture =
        _profileService.profile(); // جلب بيانات المستخدم عند بدء التشغيل
  }

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
            FutureBuilder<ProfileModel>(
              future: _profileFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return UserAccountsDrawerHeader(
                    accountName: Text(S.of(context).Loading),
                    accountEmail: Text(S.of(context).Loading),
                    currentAccountPicture: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return UserAccountsDrawerHeader(
                    accountName: Text(S.of(context).Error),
                    accountEmail: Text(S.of(context).Failed_to_load_profile),
                    currentAccountPicture: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.error, color: Colors.red),
                    ),
                  );
                } else if (!snapshot.hasData) {
                  return UserAccountsDrawerHeader(
                    accountName: Text(S.of(context).No_Data),
                    accountEmail: Text(S.of(context).No_profile_data_available),
                    currentAccountPicture: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.warning, color: Colors.orange),
                    ),
                  );
                } else {
                  final profileData = snapshot.data!.data;
                  return UserAccountsDrawerHeader(
                    accountName: Text(
                        '${profileData.firstName} ${profileData.lastName}'),
                    accountEmail: Text(profileData.email),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: profileData.image != null
                          ? NetworkImage('$baseUrlImage/${profileData.image!}')
                          : const AssetImage(
                                  'images/1732817786.Default-Profile-Picture.png')
                              as ImageProvider,
                    ),
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: Text(S.of(context).Orders),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShowOrdersPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: Text(S.of(context).Cart),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text(S.of(context).Profile),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ElevatedButton(
                onPressed: () async {
                  loadingIndicatorTrue();

                  try {
                    await LogoutService().logout();
                    print('Success');
                    loadingIndicatorFalse();
                    Get.snackbar(
                      S.of(context).Hi,
                      S.of(context).User_Successfully_logged_out,
                    );
                    sharedPreferences!.clear();
                    Get.off(() => const Loginpage());
                  } catch (e) {
                    print(e.toString());
                    Get.snackbar(
                      S.of(context).Sorry,
                      e.toString(),
                      colorText: Colors.white,
                      backgroundColor: Colors.red,
                    );
                  }
                  loadingIndicatorFalse();
                },
                style: ElevatedButton.styleFrom(),
                child: Text(S.of(context).Logout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
