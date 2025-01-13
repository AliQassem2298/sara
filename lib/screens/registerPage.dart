// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sara/screens/home%20page.dart';
import 'package:sara/screens/login_page.dart';
import 'package:sara/services/register_service.dart';
import 'package:sara/widgets/custom_button_register.dart';
import 'package:sara/widgets/custom_textFormfield.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  RxBool isLoading = false.obs;
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController mylocation = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();

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
          centerTitle: true,
          titleTextStyle:
              const TextStyle(textBaseline: TextBaseline.ideographic),
          backgroundColor: Colors.cyan,
          title: const Text(
            'WELCOME SIGN UP',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Form(
          key: formState,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Spacer(
              //   flex: 1,
              // ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required.';
                      }

                      return null; // لا يوجد خطأ
                    },
                    textEditingController: firstName,
                    hintText: 'FirstName',
                    icon: const Icon(Icons.person),
                    iconEnd: null,
                    isPassword: false,
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required.';
                      }

                      return null; // لا يوجد خطأ
                    },
                    textEditingController: lastName,
                    hintText: 'LastName',
                    icon: const Icon(Icons.person),
                    iconEnd: null,
                    isPassword: false,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }
                    if (value.length != 10 || !value.isPhoneNumber) {
                      return 'You have to enter right number.';
                    }
                    return null; // لا يوجد خطأ
                  },
                  textEditingController: phone,
                  hintText: 'YourNamber',
                  icon: const Icon(Icons.phone),
                  iconEnd: null,
                  isPassword: false,
                  keyboardType: TextInputType.phone,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
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
                  hintText: 'YourEmail',
                  icon: const Icon(Icons.email),
                  iconEnd: null,
                  isPassword: false,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }

                    return null; // لا يوجد خطأ
                  },
                  textEditingController: userName,
                  hintText: 'UserName',
                  icon: const Icon(Icons.person),
                  iconEnd: null,
                  isPassword: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }

                    return null; // لا يوجد خطأ
                  },
                  textEditingController: mylocation,
                  hintText: 'Location',
                  icon: const Icon(Icons.location_city),
                  iconEnd: null,
                  isPassword: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }

                    return null; // لا يوجد خطأ
                  },
                  textEditingController: password,
                  hintText: 'YourPassword',
                  icon: const Icon(Icons.lock_open_sharp),
                  iconEnd: const Icon(Icons.visibility_off),
                  isPassword: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required.';
                    }
                    if (value.length < 8) {
                      return 'The password must be more than 8.';
                    }
                    if (password.text != passwordConfirmation.text) {
                      return 'Passwords didn\'t match';
                    }
                    return null; // لا يوجد خطأ
                  },
                  textEditingController: passwordConfirmation,
                  hintText: 'ConfirmYourPassword',
                  icon: const Icon(Icons.lock),
                  iconEnd: const Icon(Icons.visibility_off),
                  isPassword: true,
                ),
              ),
              CustomButton(
                text: 'Sign Up',
                onPressed: () async {
                  if (formState.currentState!.validate()) {
                    loadingIndicatorTrue();
                    try {
                      await RegisterService().register(
                        firstName: firstName.text,
                        lastName: lastName.text,
                        userName: userName.text,
                        email: email.text,
                        phone: phone.text,
                        mylocation: mylocation.text,
                        password: password.text,
                        passwordConfirmation: passwordConfirmation.text,
                      );
                      print('Success');
                      loadingIndicatorFalse();
                      Get.snackbar(
                        'Hi',
                        'User created successfully',
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
                    child: Text('Have account? '),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(() => const Loginpage());
                    },
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              // Spacer(
              //   flex: 1,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}