// ignore_for_file: must_be_immutable, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sara/generated/l10n.dart';
import 'package:sara/screens/home%20page.dart';
import 'package:sara/screens/registerPage.dart';
import 'package:sara/services/login_service.dart';
import 'package:sara/widgets/custom_button_register.dart';
import 'package:sara/widgets/custom_textFormfield.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  GlobalKey<FormState> formState = GlobalKey();

  RxBool isLoading = false.obs;

  void loadingIndicatorFalse() {
    isLoading.value = false;
    setState(() {});
  }

  void loadingIndicatorTrue() {
    isLoading.value = true;
    setState(() {});
  }

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  void changeLanguage(Locale locale) {
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading.value,
      child: Scaffold(
        body: Form(
          key: formState,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).This_field_is_required;
                      }
                      if (!value.isEmail) {
                        return S
                            .of(context)
                            .Please_enter_an_valid_email_address;
                      }
                      return null;
                    },
                    textEditingController: email,
                    validateName: S.of(context).email,
                    hintText: S.of(context).email,
                    icon: const Icon(Icons.email_outlined),
                    iconEnd: null,
                    isPassword: false,
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return S.of(context).This_field_is_required;
                      }
                      if (value.length < 8) {
                        return S.of(context).The_password_must_be_more_than_8;
                      }
                      return null;
                    },
                    textEditingController: password,
                    hintText: S.of(context).password,
                    icon: const Icon(Icons.lock),
                    iconEnd: const Icon(Icons.visibility_off),
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: S.of(context).Login,
                    onPressed: () async {
                      if (formState.currentState!.validate()) {
                        loadingIndicatorTrue();

                        try {
                          await LoginService().login(
                            email: email.text,
                            password: password.text,
                          );
                          print('Success');
                          loadingIndicatorFalse();
                          Get.snackbar(
                            S.of(context).Hi,
                            S.of(context).User_logged_in_successfully,
                          );
                          Get.off(() => const HomePage());
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
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(S.of(context).Dont_have_an_account),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offAll(() => const Registerpage());
                        },
                        child: Text(
                          S.of(context).REGISTER,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // زر تغيير اللغة
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          changeLanguage(const Locale('en'));
                        },
                        child: Text(
                          'English',
                          style: TextStyle(
                            color: Get.locale?.languageCode == 'en'
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          changeLanguage(const Locale('ar'));
                        },
                        child: Text(
                          'العربية',
                          style: TextStyle(
                            color: Get.locale?.languageCode == 'ar'
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
