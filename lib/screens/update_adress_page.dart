// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sara/services/update_location_service.dart';
import 'package:sara/widgets/custom_textFormfield.dart';

class UpdateAdressPage extends StatefulWidget {
  const UpdateAdressPage({super.key});

  @override
  State<UpdateAdressPage> createState() => _UpdateAdressPageState();
}

class _UpdateAdressPageState extends State<UpdateAdressPage> {
  TextEditingController location = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading.value,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Update Your Adress"),
        ),
        body: Form(
          key: formState,
          child: Column(
            children: [
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required.';
                  }

                  return null; // لا يوجد خطأ
                },
                textEditingController: location,
                validateName: "location",
                hintText: 'Location',
                icon: const Icon(Icons.location_on),
                iconEnd: null,
                isPassword: false,
              ).paddingSymmetric(horizontal: 20, vertical: 16),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () async {
                      if (formState.currentState!.validate()) {
                        loadingIndicatorTrue();

                        try {
                          await UpdateLocationService()
                              .updateLocation(address: location.text);
                          print('Success');
                          loadingIndicatorFalse();
                          Get.snackbar(
                            'Hi',
                            'Location updated successfully',
                          );
                          Navigator.pop(context,
                              true); // تمرير true للإشارة إلى نجاح التحديث
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
                    child: const Text(
                      'Save Adress',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
