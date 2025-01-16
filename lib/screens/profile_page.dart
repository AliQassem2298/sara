// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sara/generated/l10n.dart';
import 'package:sara/helper/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sara/screens/EditProfilePage.dart';
import 'package:sara/screens/ProfileInfoField..dart';
import 'package:sara/models/profile_model.dart';
import 'package:sara/screens/update_adress_page.dart';
import 'package:sara/services/profile_service.dart';
import 'package:sara/services/upload_image_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isArabic = false;
  late Future<ProfileModel> _profileFuture;
  File? _file;
  bool isUploading = false;
  ProfileModel? user;
  void pickercamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
      });
      uploadImage(_file!);
    }
  }

  Future<void> uploadImage(File imageFile) async {
    setState(() {
      isUploading = true;
    });
    try {
      final response = await UploadImageService().uploadProfileImage(imageFile);
      Get.snackbar(S.of(context).Success,
          '${S.of(context).Image_uploaded_successfully}: ${response.message}');
    } catch (e) {
      print(e);
      Get.snackbar(
          S.of(context).Error, '${S.of(context).Failedtouploadimage}: $e');
    } finally {
      setState(() {
        isUploading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _profileFuture = ProfileService().profile();
  }

  // void _toggleLanguage() {
  //   setState(() {
  //     isArabic = !isArabic;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(S.of(context).Profile),
      ),
      body: FutureBuilder<ProfileModel>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '$Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            final profile = snapshot.data!;
            user = profile;

            return _buildProfileContent(profile.data);
          } else {
            return Center(child: Text(S.of(context).Nodataavailable));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // فتح صفحة التعديل والانتظار لنتيجة التحديث
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditProfilePage(user: user!)),
          );

          // إذا تم تحديث البيانات بنجاح، قم بإعادة تحميل البيانات
          if (result == true) {
            setState(() {
              _profileFuture =
                  ProfileService().profile(); // إعادة استدعاء البيانات
            });
          }
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  Widget _buildProfileContent(ProfileData data) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(300)),
                  child: _file != null
                      ? Image.file(
                          _file!,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        )
                      : data.image == null
                          ? Image.asset(
                              'images/1732817786.Default-Profile-Picture.png',
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            )
                          : Image.network(
                              '$baseUrlImage/${data.image}',
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            ),
                ),
                Positioned(
                  bottom: -10,
                  right: -10,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: pickercamera,
                  ),
                ),
                if (isUploading)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.firstName,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.cyan),
          ),
          const SizedBox(height: 30),
          Profileinfofield(
              icon: Icons.person_outline,
              title: '${S.of(context).firstname} :',
              value: data.firstName),
          Profileinfofield(
              icon: Icons.person_outline,
              title: '${S.of(context).lastname} :',
              value: data.lastName),
          Profileinfofield(
              icon: Icons.person_outline,
              title: '${S.of(context).username} :',
              value: data.userName),
          Profileinfofield(
              icon: Icons.email,
              title: '${S.of(context).email} :',
              value: data.email),
          Profileinfofield(
              icon: Icons.location_on,
              title: '${S.of(context).Location} :',
              value: data.address),
          Profileinfofield(
              icon: Icons.phone,
              title: '${S.of(context).phonenumber} :',
              value: data.phone),
          const SizedBox(height: 30),
          // Text(
          //   isArabic ? 'اللغة' : 'Language',
          //   style: const TextStyle(fontSize: 18),
          // ),
          // Switch(
          //   value: isArabic,
          //   onChanged: (value) => _toggleLanguage(),
          // ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            onPressed: () async {
              final result = await Get.to(() => const UpdateAdressPage());

              if (result == true) {
                setState(() {
                  _profileFuture = ProfileService().profile();
                });
              }
            },
            child: Text(
              S.of(context).UpdateAdress,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
