// ignore_for_file: library_private_types_in_public_api, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sara/generated/l10n.dart';
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
          title: Text(
            S.of(context).Editprofile,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
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
                    child: widget.user.data.image != null
                        ? Image.network(
                            '$baseUrlImage/${widget.user.data.image}',
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          )
                        : Image.asset(
                            'images/1732817786.Default-Profile-Picture.png',
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    firstName,
                    S.of(context).firstname,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).This_field_is_required;
                      }

                      return null; // لا يوجد خطأ
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    lastName,
                    S.of(context).LastName,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).This_field_is_required;
                      }

                      return null; // لا يوجد خطأ
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    email,
                    S.of(context).email,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).This_field_is_required;
                      }
                      if (!value.isEmail) {
                        return S
                            .of(context)
                            .Please_enter_an_valid_email_address;
                      }

                      return null; // لا يوجد خطأ
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    userName,
                    S.of(context).username,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).This_field_is_required;
                      }

                      return null; // لا يوجد خطأ
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    phone,
                    S.of(context).phonenumber,
                    (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).This_field_is_required;
                      }
                      if (value.length != 10 || !value.isPhoneNumber) {
                        return S.of(context).You_have_to_enter_right_number;
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
                          Get.snackbar(S.of(context).Hi,
                              S.of(context).Informationupdatedsuccessfully);

                          // إرجاع المستخدم إلى صفحة البروفايل مع تحديث البيانات
                          Navigator.pop(context,
                              true); // تمرير true للإشارة إلى نجاح التحديث
                        } catch (e) {
                          Get.snackbar(S.of(context).Sorry, e.toString(),
                              colorText: Colors.white,
                              backgroundColor: Colors.red);
                        } finally {
                          loadingIndicatorFalse();
                        }
                      }
                    },
                    child: Text(
                      S.of(context).Savechanges,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
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
