// ignore_for_file: library_private_types_in_public_api, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sara/helper/api.dart';
import 'package:sara/models/profile_model.dart';
import 'package:sara/services/update_profile_service.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileModel user;

  const EditProfilePage({super.key, required this.user});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController userName;
  late TextEditingController phone;

  RxBool isLoading = false.obs;

  @override
  void initState() {
    super.initState();

    // Initialize controllers with current profile data
    firstName = TextEditingController(text: widget.user.data.firstName);
    lastName = TextEditingController(text: widget.user.data.lastName);
    email = TextEditingController(text: widget.user.data.email);
    userName = TextEditingController(text: widget.user.data.userName);
    phone = TextEditingController(text: widget.user.data.phone);
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
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_arrow_left, color: Colors.white),
          ),
          title: const Text(
            'Edit profile',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.cyan,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(300)),
                    child: Image.network(
                      '$baseUrlImage/${widget.user.data.image}',
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    firstName,
                    'first name',
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required.';
                      }

                      return null; // لا يوجد خطأ
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    lastName,
                    'last name',
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required.';
                      }

                      return null; // لا يوجد خطأ
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    email,
                    'email',
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required.';
                      }
                      if (!value.isEmail) {
                        return 'Please enter an valid email address.';
                      }

                      return null; // لا يوجد خطأ
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    userName,
                    'username',
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required.';
                      }

                      return null; // لا يوجد خطأ
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    phone,
                    'phone',
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required.';
                      }
                      if (value.length != 10 || !value.isPhoneNumber) {
                        return 'You have to enter right number.';
                      }
                      return null; // لا يوجد خطأ
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
// بعد حفظ التعديلات بنجاح
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        loadingIndicatorTrue();

                        try {
                          await UpdateProfileService().updateProfile(
                            firstName: firstName.text,
                            lastName: lastName.text,
                            userName: userName.text,
                            email: email.text,
                            phone: phone.text,
                          );

                          // عرض رسالة نجاح
                          Get.snackbar(
                              'Hi', 'Information updated successfully');

                          // إرجاع المستخدم إلى صفحة البروفايل مع تحديث البيانات
                          Navigator.pop(context,
                              true); // تمرير true للإشارة إلى نجاح التحديث
                        } catch (e) {
                          Get.snackbar('Sorry', e.toString(),
                              colorText: Colors.white,
                              backgroundColor: Colors.red);
                        } finally {
                          loadingIndicatorFalse();
                        }
                      }
                    },
                    child: const Text('Save changes',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      final FormFieldValidator<String>? validator) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
            labelText: label, border: const OutlineInputBorder()),
        validator: validator);
  }

  @override
  void dispose() {
    // Dispose of the controllers
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    userName.dispose();
    phone.dispose();
    super.dispose();
  }
}
