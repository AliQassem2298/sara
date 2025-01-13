// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
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
                    // width:  MediaQuery.of(context).size.width,
                  ),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required.';
                      }
                      if (!value.isEmail) {
                        return 'Please enter an valid email address.';
                      }

                      return null; // لا يوجد خطأ
                    },
                    textEditingController: email,
                    validateName: "email",
                    hintText: 'Email',
                    icon: const Icon(Icons.email_outlined),
                    iconEnd: null,
                    isPassword: false,
                  ),
                  const SizedBox(height: 30),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required.';
                      }
                      if (value.length < 8) {
                        return 'The password must be more than 8.';
                      }
                      return null; // لا يوجد خطأ
                    },
                    textEditingController: password,
                    hintText: 'password',
                    icon: const Icon(Icons.lock),
                    iconEnd: const Icon(Icons.visibility_off),
                    isPassword: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'Login',
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
                            'Hi',
                            'User logged in successfully',
                          );
                          Get.off(() => const HomePage());
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
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text('Don\'t have an account? '),
                      ),
                      InkWell(
                        onTap: () {
                          Get.offAll(() => const Registerpage());
                        },
                        child: const Text(
                          'REGISTER',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
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
